import 'dart:convert';
import 'package:drift/drift.dart';
import 'connection/connection.dart' as conn;

part 'app_database.g.dart';

class SubjectPacks extends Table {
  TextColumn get id => text()();
  TextColumn get subjectCode => text()();
  TextColumn get title => text()();
  TextColumn get examTrack => text()();
  TextColumn get nerdcLevel => text()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();
  TextColumn get checksum => text()();
  TextColumn get status => text().withDefault(const Constant('installed'))();
  DateTimeColumn get installedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Lessons extends Table {
  TextColumn get id => text()();
  TextColumn get packId => text().references(SubjectPacks, #id)();
  TextColumn get moduleTitle => text()();
  IntColumn get orderIndex => integer()();
  TextColumn get title => text()();
  IntColumn get estimatedMinutes => integer().withDefault(const Constant(8))();
  TextColumn get objectivesJson => text()();
  TextColumn get simpleSummaryMarkdown => text()();
  TextColumn get formalSummaryMarkdown => text()();
  TextColumn get keyRulesJson => text()();
  BoolColumn get isBookmarked => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class LessonSteps extends Table {
  TextColumn get id => text()();
  TextColumn get lessonId => text().references(Lessons, #id)();
  IntColumn get stepOrder => integer()();
  TextColumn get stepType => text()(); // concept|worked_example|interactive_sim|oral_drill|checkpoint
  TextColumn get contentMarkdown => text()();
  TextColumn get revealStepsJson => text().withDefault(const Constant('[]'))();
  TextColumn get simConfigJson => text().withDefault(const Constant('{}'))();
  TextColumn get checkpointQuestionJson => text().withDefault(const Constant('{}'))();

  @override
  Set<Column> get primaryKey => {id};
}

class Questions extends Table {
  TextColumn get id => text()();
  TextColumn get packId => text().references(SubjectPacks, #id)();
  TextColumn get relatedLessonId => text()();
  TextColumn get examBody => text()();
  IntColumn get examYear => integer()();
  TextColumn get paperType => text()(); // objective|theory|oral
  TextColumn get stemMarkdown => text()();
  TextColumn get diagramAssetPath => text().nullable()();
  TextColumn get optionsJson => text()();
  IntColumn get correctIndex => integer()();
  TextColumn get answerSummary => text()();
  TextColumn get workedStepsJson => text()();
  TextColumn get distractorNotesJson => text()();
  TextColumn get markingPointsJson => text().withDefault(const Constant('[]'))();
  TextColumn get examinerTip => text()();
  TextColumn get difficulty => text().withDefault(const Constant('medium'))();

  @override
  Set<Column> get primaryKey => {id};
}

class MistakeVaultSm2 extends Table {
  TextColumn get questionId => text().references(Questions, #id)();
  RealColumn get easeFactor => real().withDefault(const Constant(2.5))();
  IntColumn get intervalDays => integer().withDefault(const Constant(1))();
  IntColumn get repetitions => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextReviewAt => dateTime()();
  TextColumn get lastOutcome => text().withDefault(const Constant('wrong'))();
  TextColumn get userNote => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {questionId};
}

class StudyPreferences extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get activeTrack => text().withDefault(const Constant('waec_neco'))();
  DateTimeColumn get targetExamDate => dateTime().nullable()();
  IntColumn get dailyGoalMinutes => integer().withDefault(const Constant(20))();
  TextColumn get themeMode => text().withDefault(const Constant('light'))();
  TextColumn get fontScale => text().withDefault(const Constant('normal'))();
  IntColumn get streakDays => integer().withDefault(const Constant(1))();
  DateTimeColumn get lastStudyDate => dateTime().nullable()();
  BoolColumn get diagnosticCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get diagnosticSummary => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

class LessonProgress extends Table {
  TextColumn get lessonId => text().references(Lessons, #id)();
  IntColumn get completedSteps => integer().withDefault(const Constant(0))();
  IntColumn get totalSteps => integer().withDefault(const Constant(1))();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {lessonId};
}

class ActiveExamSessions extends Table {
  TextColumn get id => text()();
  TextColumn get track => text()();
  TextColumn get mode => text()(); // study|timed
  TextColumn get title => text()();
  TextColumn get questionIdsJson => text()();
  TextColumn get answersJson => text()();
  IntColumn get remainingSeconds => integer()();
  IntColumn get currentIndex => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ExamAttempts extends Table {
  TextColumn get id => text()();
  TextColumn get track => text()();
  TextColumn get title => text()();
  IntColumn get rawCorrect => integer()();
  IntColumn get totalQuestions => integer()();
  IntColumn get scaledScore => integer()();
  IntColumn get scaledMax => integer()();
  TextColumn get gradeCode => text()();
  DateTimeColumn get completedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Flashcards extends Table {
  TextColumn get id => text()();
  TextColumn get lessonId => text()();
  TextColumn get subjectTitle => text()();
  TextColumn get ruleText => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class FtsSearchResult {
  FtsSearchResult({
    required this.kind,
    required this.itemId,
    required this.title,
    required this.snippet,
  });

  final String kind; // 'lesson' | 'question'
  final String itemId;
  final String title;
  final String snippet;
}

@DriftDatabase(tables: [
  SubjectPacks,
  Lessons,
  LessonSteps,
  Questions,
  MistakeVaultSm2,
  StudyPreferences,
  LessonProgress,
  ActiveExamSessions,
  ExamAttempts,
  Flashcards,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? conn.openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await customStatement(
            'CREATE VIRTUAL TABLE IF NOT EXISTS content_fts USING fts5(kind, item_id, title, body);',
          );
          await into(studyPreferences).insert(
            StudyPreferencesCompanion.insert(
              id: const Value(1),
              activeTrack: const Value('waec_neco'),
              dailyGoalMinutes: const Value(20),
              themeMode: const Value('light'),
              fontScale: const Value('normal'),
            ),
            mode: InsertMode.insertOrIgnore,
          );
        },
      );

  Future<void> upsertFtsEntry({
    required String kind,
    required String itemId,
    required String title,
    required String body,
  }) async {
    await customStatement(
      'DELETE FROM content_fts WHERE kind = ? AND item_id = ?;',
      [kind, itemId],
    );
    await customStatement(
      'INSERT INTO content_fts(kind, item_id, title, body) VALUES (?, ?, ?, ?);',
      [kind, itemId, title, body],
    );
  }

  Future<List<FtsSearchResult>> searchOfflineContent(String rawQuery) async {
    final cleaned = rawQuery.trim().replaceAll(RegExp(r'[^\w\s]'), ' ').trim();
    if (cleaned.isEmpty) return [];
    final tokens = cleaned.split(RegExp(r'\s+')).where((t) => t.isNotEmpty).map((t) => '$t*').join(' ');
    try {
      final rows = await customSelect(
        'SELECT kind, item_id, title, substr(body, 1, 140) AS snippet FROM content_fts WHERE content_fts MATCH ? LIMIT 25;',
        variables: [Variable.withString(tokens)],
      ).get();
      return rows
          .map((r) => FtsSearchResult(
                kind: r.read<String>('kind'),
                itemId: r.read<String>('item_id'),
                title: r.read<String>('title'),
                snippet: r.read<String>('snippet'),
              ))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<StudyPreference> getPreferences() async {
    final existing = await (select(studyPreferences)..where((t) => t.id.equals(1))).getSingleOrNull();
    if (existing != null) return existing;
    await into(studyPreferences).insert(
      StudyPreferencesCompanion.insert(id: const Value(1)),
      mode: InsertMode.insertOrIgnore,
    );
    return (select(studyPreferences)..where((t) => t.id.equals(1))).getSingle();
  }

  Future<void> updatePreferences(StudyPreferencesCompanion companion) async {
    await (update(studyPreferences)..where((t) => t.id.equals(1))).write(companion);
  }

  Future<void> recordLessonStepProgress({
    required String lessonId,
    required int completedSteps,
    required int totalSteps,
    required bool isCompleted,
  }) async {
    await into(lessonProgress).insertOnConflictUpdate(
      LessonProgressCompanion(
        lessonId: Value(lessonId),
        completedSteps: Value(completedSteps),
        totalSteps: Value(totalSteps),
        isCompleted: Value(isCompleted),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<List<String>> decodeJsonList(String raw) async {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List) {
        return decoded.map((e) => e.toString()).toList();
      }
    } catch (_) {}
    return const [];
  }

  Future<void> saveActiveSession({
    required String id,
    required String track,
    required String mode,
    required String title,
    required List<String> questionIds,
    required Map<String, int> answers,
    required int remainingSeconds,
    required int currentIndex,
  }) async {
    await into(activeExamSessions).insertOnConflictUpdate(
      ActiveExamSessionsCompanion(
        id: Value(id),
        track: Value(track),
        mode: Value(mode),
        title: Value(title),
        questionIdsJson: Value(jsonEncode(questionIds)),
        answersJson: Value(jsonEncode(answers)),
        remainingSeconds: Value(remainingSeconds),
        currentIndex: Value(currentIndex),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<ActiveExamSession?> getLatestActiveSession() async {
    final rows = await (select(activeExamSessions)
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
          ..limit(1))
        .get();
    return rows.isEmpty ? null : rows.first;
  }

  Future<void> deleteActiveSession(String id) async {
    await (delete(activeExamSessions)..where((t) => t.id.equals(id))).go();
  }
}
