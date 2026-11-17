import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import '../db/app_database.dart';
import '../db/pack_validator.dart';

class StarterPackSeeder {
  static const List<String> coreAssets = [
    'assets/packs/pack_mth.json',
    'assets/packs/pack_eng.json',
    'assets/packs/pack_bio.json',
    'assets/packs/pack_chm.json',
    'assets/packs/pack_phy.json',
    'assets/packs/pack_eco.json',
  ];

  static Future<List<String>> discoverAllPackAssets() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    return manifest
        .listAssets()
        .where((key) => key.startsWith('assets/packs/') && key.endsWith('.json'))
        .toList()
      ..sort();
  }

  static Future<void> seedIfNeeded(AppDatabase db) async {
    final existingPacks = await db.select(db.subjectPacks).get();
    if (existingPacks.isNotEmpty) return;

    for (final assetPath in coreAssets) {
      try {
        final rawJson = await rootBundle.loadString(assetPath);
        await importPackFromJsonString(db, rawJson);
      } catch (_) {}
    }
  }

  static Future<int> seedRemainingCatalogPacks(
    AppDatabase db, {
    void Function(int loaded, int total)? onProgress,
  }) async {
    final allAssets = await discoverAllPackAssets();
    final existingIds =
        (await db.select(db.subjectPacks).get()).map((p) => p.id).toSet();

    var importedCount = 0;
    for (var i = 0; i < allAssets.length; i++) {
      final path = allAssets[i];
      final rawJson = await rootBundle.loadString(path);
      final map = jsonDecode(rawJson) as Map<String, dynamic>;
      final packId = map['id'] as String;
      if (!existingIds.contains(packId)) {
        await importPackFromMap(db, map, rawJson);
        existingIds.add(packId);
        importedCount++;
      }
      onProgress?.call(i + 1, allAssets.length);
    }
    return importedCount;
  }

  static Future<void> importPackFromJsonString(
    AppDatabase db,
    String rawJson,
  ) async {
    final map = jsonDecode(rawJson) as Map<String, dynamic>;
    await importPackFromMap(db, map, rawJson);
  }

  static Future<void> importPackFromMap(
    AppDatabase db,
    Map<String, dynamic> map,
    String rawJson,
  ) async {
    PackValidator.validatePackMap(map);

    final packId = map['id'] as String;
    final checksum = PackValidator.computeSha256(rawJson);
    final sizeBytes = utf8.encode(rawJson).length;

    final lessons = (map['lessons'] as List?) ?? const [];
    final questions = (map['questions'] as List?) ?? const [];

    await db.transaction(() async {
      await db.into(db.subjectPacks).insertOnConflictUpdate(
            SubjectPacksCompanion(
              id: Value(packId),
              subjectCode: Value(map['subjectCode'] as String),
              title: Value(map['title'] as String),
              examTrack: Value(map['examTrack'] as String),
              nerdcLevel: Value(map['nerdcLevel'] as String),
              version: Value((map['version'] as num?)?.toInt() ?? 1),
              sizeBytes: Value(sizeBytes),
              checksum: Value(checksum),
              status: const Value('installed'),
              installedAt: Value(DateTime.now()),
            ),
          );

      final lessonCompanions = <LessonsCompanion>[];
      final stepCompanions = <LessonStepsCompanion>[];
      final ftsRows = <(String kind, String itemId, String title, String body)>[];

      for (final rawLesson in lessons) {
        final l = rawLesson as Map<String, dynamic>;
        final lessonId = l['id'] as String;
        final title = l['title'] as String;
        final simpleSummary = l['simpleSummaryMarkdown'] as String;
        final formalSummary = l['formalSummaryMarkdown'] as String;

        lessonCompanions.add(
          LessonsCompanion(
            id: Value(lessonId),
            packId: Value(packId),
            moduleTitle: Value(l['moduleTitle'] as String),
            orderIndex: Value((l['orderIndex'] as num).toInt()),
            title: Value(title),
            estimatedMinutes:
                Value((l['estimatedMinutes'] as num?)?.toInt() ?? 8),
            objectivesJson: Value(jsonEncode(l['objectives'] ?? const [])),
            simpleSummaryMarkdown: Value(simpleSummary),
            formalSummaryMarkdown: Value(formalSummary),
            keyRulesJson: Value(jsonEncode(l['keyRules'] ?? const [])),
          ),
        );

        ftsRows.add(('lesson', lessonId, title, '$simpleSummary $formalSummary'));

        final steps = (l['steps'] as List?) ?? const [];
        for (final rawStep in steps) {
          final s = rawStep as Map<String, dynamic>;
          stepCompanions.add(
            LessonStepsCompanion(
              id: Value(s['id'] as String),
              lessonId: Value(lessonId),
              stepOrder: Value((s['stepOrder'] as num).toInt()),
              stepType: Value(s['stepType'] as String),
              contentMarkdown: Value(s['contentMarkdown'] as String),
              revealStepsJson: Value(jsonEncode(s['revealSteps'] ?? const [])),
              simConfigJson: Value(jsonEncode(s['simConfig'] ?? const {})),
              checkpointQuestionJson:
                  Value(jsonEncode(s['checkpointQuestion'] ?? const {})),
            ),
          );
        }
      }

      final questionCompanions = <QuestionsCompanion>[];
      for (final rawQ in questions) {
        final q = rawQ as Map<String, dynamic>;
        final qId = q['id'] as String;
        final stem = q['stemMarkdown'] as String;
        final answerSummary = q['answerSummary'] as String;

        questionCompanions.add(
          QuestionsCompanion(
            id: Value(qId),
            packId: Value(packId),
            relatedLessonId: Value(q['relatedLessonId'] as String),
            examBody: Value(q['examBody'] as String),
            examYear: Value((q['examYear'] as num).toInt()),
            paperType: Value(q['paperType'] as String),
            stemMarkdown: Value(stem),
            diagramAssetPath: Value(q['diagramAssetPath'] as String?),
            optionsJson: Value(jsonEncode(q['options'] ?? const [])),
            correctIndex: Value((q['correctIndex'] as num).toInt()),
            answerSummary: Value(answerSummary),
            workedStepsJson: Value(jsonEncode(q['workedSteps'] ?? const [])),
            distractorNotesJson:
                Value(jsonEncode(q['distractorNotes'] ?? const {})),
            markingPointsJson:
                Value(jsonEncode(q['markingPoints'] ?? const [])),
            examinerTip: Value(q['examinerTip'] as String),
            difficulty: Value((q['difficulty'] as String?) ?? 'medium'),
          ),
        );

        ftsRows.add((
          'question',
          qId,
          '${q['examBody']} ${q['examYear']} · $answerSummary',
          stem,
        ));
      }

      await db.batch((b) {
        b.insertAllOnConflictUpdate(db.lessons, lessonCompanions);
        b.insertAllOnConflictUpdate(db.lessonSteps, stepCompanions);
        b.insertAllOnConflictUpdate(db.questions, questionCompanions);
      });

      // Index lessons in FTS5 and sample questions for fast offline search
      for (final row in ftsRows.take(120)) {
        await db.upsertFtsEntry(
          kind: row.$1,
          itemId: row.$2,
          title: row.$3,
          body: row.$4,
        );
      }
    });
  }
}
