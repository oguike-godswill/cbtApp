import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:naijaprep/core/models/exam_track.dart';
import 'package:naijaprep/data/db/pack_validator.dart';
import 'package:naijaprep/domain/grading/grading_engine.dart';
import 'package:naijaprep/domain/sm2/sm2_scheduler.dart';

void main() {
  group('Sm2Scheduler', () {
    test('wrong answer resets interval to 1 day and repetitions to 0', () {
      final state = Sm2Scheduler.schedule(
        isCorrect: false,
        now: DateTime(2026, 11, 17),
      );
      expect(state.intervalDays, 1);
      expect(state.repetitions, 0);
      expect(state.lastOutcome, 'wrong');
      expect(state.isMastered, isFalse);
    });

    test('consecutive correct answers advance 1d -> 3d -> 7d', () {
      final t0 = DateTime(2026, 11, 17);
      final s1 = Sm2Scheduler.schedule(isCorrect: true, now: t0);
      expect(s1.intervalDays, 1);
      expect(s1.repetitions, 1);

      final s2 = Sm2Scheduler.schedule(current: s1, isCorrect: true, now: t0);
      expect(s2.intervalDays, 3);
      expect(s2.repetitions, 2);

      final s3 = Sm2Scheduler.schedule(current: s2, isCorrect: true, now: t0);
      expect(s3.intervalDays, 7);
      expect(s3.repetitions, 3);
      expect(s3.isMastered, isTrue);
    });
  });

  group('GradingEngine', () {
    test('NCEE scales to 200', () {
      final res = GradingEngine.grade(
        track: ExamTrack.ncee,
        rawCorrect: 8,
        totalQuestions: 10,
      );
      expect(res.scaledScore, 160);
      expect(res.scaledMax, 200);
      expect(res.gradeCode, 'Merit');
    });

    test('BECE assigns Distinction, Credit, Pass, Fail', () {
      expect(
        GradingEngine.grade(track: ExamTrack.bece, rawCorrect: 8, totalQuestions: 10).gradeCode,
        'Distinction',
      );
      expect(
        GradingEngine.grade(track: ExamTrack.bece, rawCorrect: 6, totalQuestions: 10).gradeCode,
        'Credit',
      );
      expect(
        GradingEngine.grade(track: ExamTrack.bece, rawCorrect: 4, totalQuestions: 10).gradeCode,
        'Pass',
      );
      expect(
        GradingEngine.grade(track: ExamTrack.bece, rawCorrect: 2, totalQuestions: 10).gradeCode,
        'Fail',
      );
    });

    test('WAEC/NECO assigns A1 through F9', () {
      expect(
        GradingEngine.grade(track: ExamTrack.waecNeco, rawCorrect: 8, totalQuestions: 10).gradeCode,
        'A1',
      );
      expect(
        GradingEngine.grade(track: ExamTrack.waecNeco, rawCorrect: 5, totalQuestions: 10).gradeCode,
        'C6',
      );
      expect(
        GradingEngine.grade(track: ExamTrack.waecNeco, rawCorrect: 3, totalQuestions: 10).gradeCode,
        'F9',
      );
    });

    test('JAMB UTME scales to 400', () {
      final res = GradingEngine.grade(
        track: ExamTrack.jambUtme,
        rawCorrect: 3,
        totalQuestions: 4,
      );
      expect(res.scaledScore, 300);
      expect(res.scaledMax, 400);
      expect(res.gradeCode, '280+');
    });
  });

  group('Starter Pack Validation', () {
    test('all 33 NERDC packs satisfy the strict Question Explanation Contract and total 20,000 questions', () {
      final dir = Directory('assets/packs');
      final files = dir.listSync().whereType<File>().where((f) => f.path.endsWith('.json')).toList();
      expect(files.length, 33);

      var totalQuestions = 0;
      var totalLessons = 0;
      for (final file in files) {
        final raw = file.readAsStringSync();
        final decoded = jsonDecode(raw) as Map<String, dynamic>;
        expect(() => PackValidator.validatePackMap(decoded), returnsNormally);
        totalQuestions += (decoded['questions'] as List).length;
        totalLessons += (decoded['lessons'] as List).length;
      }
      expect(totalQuestions, 20000);
      expect(totalLessons, 3300);
    });
  });
}
