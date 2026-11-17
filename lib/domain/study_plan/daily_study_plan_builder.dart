import 'package:drift/drift.dart';
import '../../core/models/exam_track.dart';
import '../../data/db/app_database.dart';

class SubjectReadiness {
  const SubjectReadiness({
    required this.packId,
    required this.subjectCode,
    required this.title,
    required this.completedLessons,
    required this.totalLessons,
    required this.readinessPercent,
    required this.questionIds,
  });

  final String packId;
  final String subjectCode;
  final String title;
  final int completedLessons;
  final int totalLessons;
  final int readinessPercent;
  final List<String> questionIds;
}

class DailyPlanData {
  const DailyPlanData({
    required this.nextLesson,
    required this.dueMistakeCount,
    required this.practiceQuestionIds,
    required this.readinessPercent,
    required this.completedLessonsCount,
    required this.totalLessonsCount,
    required this.subjectBreakdown,
    required this.weakestSubject,
  });

  final Lesson? nextLesson;
  final int dueMistakeCount;
  final List<String> practiceQuestionIds;
  final int readinessPercent;
  final int completedLessonsCount;
  final int totalLessonsCount;
  final List<SubjectReadiness> subjectBreakdown;
  final SubjectReadiness? weakestSubject;
}

class DailyStudyPlanBuilder {
  static Future<DailyPlanData> build(AppDatabase db, ExamTrack track) async {
    final allPacks = await db.select(db.subjectPacks).get();
    final packs = allPacks
        .where((p) => track.supportsSubject(p.subjectCode))
        .toList();
    final allowedPackIds = packs.map((p) => p.id).toSet();

    final allLessonsRaw = await (db.select(db.lessons)
          ..orderBy([(t) => OrderingTerm.asc(t.orderIndex)]))
        .get();
    final allLessons = allLessonsRaw
        .where((l) => allowedPackIds.contains(l.packId))
        .toList();
    final progressRows = await db.select(db.lessonProgress).get();
    final completedIds = progressRows
        .where((p) => p.isCompleted)
        .map((p) => p.lessonId)
        .toSet();

    Lesson? nextLesson;
    for (final l in allLessons) {
      if (!completedIds.contains(l.id)) {
        nextLesson = l;
        break;
      }
    }
    nextLesson ??= allLessons.isNotEmpty ? allLessons.first : null;

    final now = DateTime.now();
    final vaultRows = await db.select(db.mistakeVaultSm2).get();
    final dueCount = vaultRows
        .where((v) => !v.nextReviewAt.isAfter(now) && v.repetitions < 3)
        .length;
    final mistakeQIds = vaultRows.map((v) => v.questionId).toSet();

    final allQuestionsRaw = await db.select(db.questions).get();
    final allQuestions = allQuestionsRaw
        .where((q) => allowedPackIds.contains(q.packId))
        .toList();
    final trackFiltered = allQuestions.where((q) {
      final body = q.examBody.toLowerCase();
      return switch (track) {
        ExamTrack.ncee => body == 'ncee',
        ExamTrack.bece => body == 'bece',
        ExamTrack.waecNeco => body == 'waec' || body == 'neco',
        ExamTrack.jambUtme => body == 'jamb' || body == 'waec',
      };
    }).toList();

    final practiceIds = (trackFiltered.isNotEmpty ? trackFiltered : allQuestions)
        .take(5)
        .map((q) => q.id)
        .toList();

    final attempts = await db.select(db.examAttempts).get();
    final avgAttemptPct = attempts.isEmpty
        ? 0.0
        : attempts
                .map((a) =>
                    (a.rawCorrect /
                        (a.totalQuestions == 0 ? 1 : a.totalQuestions)) *
                    100)
                .reduce((a, b) => a + b) /
            attempts.length;

    final lessonRatio =
        allLessons.isEmpty ? 0.0 : (completedIds.length / allLessons.length) * 100.0;
    final readiness =
        ((lessonRatio * 0.45) + (avgAttemptPct * 0.55)).round().clamp(0, 100);

    final breakdown = <SubjectReadiness>[];
    for (final pack in packs) {
      final pLessons = allLessons.where((l) => l.packId == pack.id).toList();
      final pDone = pLessons.where((l) => completedIds.contains(l.id)).length;
      final pQuestions = allQuestions.where((q) => q.packId == pack.id).toList();
      final pMistakes =
          pQuestions.where((q) => mistakeQIds.contains(q.id)).length;
      final basePct = pLessons.isEmpty
          ? 0.0
          : (pDone / pLessons.length) * 100.0;
      final penalty = pMistakes * 12;
      final subPct = (basePct - penalty).round().clamp(0, 100);

      breakdown.add(
        SubjectReadiness(
          packId: pack.id,
          subjectCode: pack.subjectCode,
          title: pack.title,
          completedLessons: pDone,
          totalLessons: pLessons.length,
          readinessPercent: subPct,
          questionIds: pQuestions.map((q) => q.id).toList(),
        ),
      );
    }

    SubjectReadiness? weakest;
    for (final item in breakdown) {
      if (item.questionIds.isEmpty) continue;
      if (weakest == null || item.readinessPercent < weakest.readinessPercent) {
        weakest = item;
      }
    }

    return DailyPlanData(
      nextLesson: nextLesson,
      dueMistakeCount: dueCount,
      practiceQuestionIds: practiceIds,
      readinessPercent: readiness,
      completedLessonsCount: completedIds.length,
      totalLessonsCount: allLessons.length,
      subjectBreakdown: breakdown,
      weakestSubject: weakest,
    );
  }
}
