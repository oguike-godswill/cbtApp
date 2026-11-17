import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/exam_track.dart';
import '../../data/db/app_database.dart';
import '../../domain/sm2/sm2_scheduler.dart';
import '../../domain/study_plan/daily_study_plan_builder.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final examLockProvider = StateProvider<bool>((ref) => false);

final seedProgressProvider = StateProvider<(int loaded, int total)?>(
  (ref) => null,
);

final jambComboProvider = StateProvider<List<String>>(
  (ref) => const ['ENG', 'MTH', 'PHY', 'CHM'],
);

class PreferencesNotifier extends AsyncNotifier<StudyPreference> {
  @override
  Future<StudyPreference> build() async {
    final db = ref.read(databaseProvider);
    return db.getPreferences();
  }

  Future<void> setTrack(ExamTrack track) async {
    final db = ref.read(databaseProvider);
    await db.updatePreferences(
      StudyPreferencesCompanion(activeTrack: Value(track.id)),
    );
    state = AsyncData(await db.getPreferences());
    ref.invalidate(dailyPlanProvider);
  }

  Future<void> setThemeMode(StudyThemeMode mode) async {
    final db = ref.read(databaseProvider);
    await db.updatePreferences(
      StudyPreferencesCompanion(themeMode: Value(mode.id)),
    );
    state = AsyncData(await db.getPreferences());
  }

  Future<void> setFontScale(FontScaleOption scale) async {
    final db = ref.read(databaseProvider);
    await db.updatePreferences(
      StudyPreferencesCompanion(fontScale: Value(scale.id)),
    );
    state = AsyncData(await db.getPreferences());
  }

  Future<void> setTargetExamDate(DateTime? date) async {
    final db = ref.read(databaseProvider);
    await db.updatePreferences(
      StudyPreferencesCompanion(targetExamDate: Value(date)),
    );
    state = AsyncData(await db.getPreferences());
  }

  Future<void> completeDiagnostic(String summary) async {
    final db = ref.read(databaseProvider);
    await db.updatePreferences(
      StudyPreferencesCompanion(
        diagnosticCompleted: const Value(true),
        diagnosticSummary: Value(summary),
      ),
    );
    state = AsyncData(await db.getPreferences());
  }
}

final preferencesProvider =
    AsyncNotifierProvider<PreferencesNotifier, StudyPreference>(
  PreferencesNotifier.new,
);

final dailyPlanProvider = FutureProvider<DailyPlanData>((ref) async {
  final db = ref.read(databaseProvider);
  final prefs = await ref.watch(preferencesProvider.future);
  return DailyStudyPlanBuilder.build(db, ExamTrack.fromId(prefs.activeTrack));
});

final subjectPacksProvider = FutureProvider<List<SubjectPack>>((ref) async {
  final db = ref.read(databaseProvider);
  return db.select(db.subjectPacks).get();
});

final lessonsProvider = FutureProvider<List<Lesson>>((ref) async {
  final db = ref.read(databaseProvider);
  return (db.select(db.lessons)
        ..orderBy([(t) => OrderingTerm.asc(t.orderIndex)]))
      .get();
});

final lessonProgressMapProvider =
    FutureProvider<Map<String, LessonProgressData>>((ref) async {
  final db = ref.read(databaseProvider);
  final rows = await db.select(db.lessonProgress).get();
  return {for (final r in rows) r.lessonId: r};
});

final mistakeVaultProvider =
    FutureProvider<List<(MistakeVaultSm2Data, Question)>>((ref) async {
  final db = ref.read(databaseProvider);
  final vaultRows = await (db.select(db.mistakeVaultSm2)
        ..orderBy([(t) => OrderingTerm.asc(t.nextReviewAt)]))
      .get();
  final questions = await db.select(db.questions).get();
  final qMap = {for (final q in questions) q.id: q};

  final result = <(MistakeVaultSm2Data, Question)>[];
  for (final v in vaultRows) {
    final q = qMap[v.questionId];
    if (q != null) result.add((v, q));
  }
  return result;
});

final examAttemptsProvider = FutureProvider<List<ExamAttempt>>((ref) async {
  final db = ref.read(databaseProvider);
  return (db.select(db.examAttempts)
        ..orderBy([(t) => OrderingTerm.desc(t.completedAt)]))
      .get();
});

final flashcardsProvider = FutureProvider<List<Flashcard>>((ref) async {
  final db = ref.read(databaseProvider);
  return (db.select(db.flashcards)
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
      .get();
});

final activeExamSessionProvider =
    FutureProvider<ActiveExamSession?>((ref) async {
  final db = ref.read(databaseProvider);
  return db.getLatestActiveSession();
});

Future<void> recordQuestionOutcomeInVault({
  required AppDatabase db,
  required WidgetRef ref,
  required String questionId,
  required bool isCorrect,
}) async {
  final existing = await (db.select(db.mistakeVaultSm2)
        ..where((t) => t.questionId.equals(questionId)))
      .getSingleOrNull();

  if (isCorrect && existing == null) {
    return;
  }

  final currentSm2 = existing == null
      ? null
      : Sm2State(
          easeFactor: existing.easeFactor,
          intervalDays: existing.intervalDays,
          repetitions: existing.repetitions,
          nextReviewAt: existing.nextReviewAt,
          lastOutcome: existing.lastOutcome,
        );

  final next = Sm2Scheduler.schedule(
    current: currentSm2,
    isCorrect: isCorrect,
  );

  await db.into(db.mistakeVaultSm2).insertOnConflictUpdate(
        MistakeVaultSm2Companion(
          questionId: Value(questionId),
          easeFactor: Value(next.easeFactor),
          intervalDays: Value(next.intervalDays),
          repetitions: Value(next.repetitions),
          nextReviewAt: Value(next.nextReviewAt),
          lastOutcome: Value(next.lastOutcome),
        ),
      );
  ref.invalidate(mistakeVaultProvider);
  ref.invalidate(dailyPlanProvider);
}
