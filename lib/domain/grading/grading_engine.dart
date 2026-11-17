import '../../core/models/exam_track.dart';

class GradeResult {
  const GradeResult({
    required this.track,
    required this.rawCorrect,
    required this.totalQuestions,
    required this.percentage,
    required this.scaledScore,
    required this.scaledMax,
    required this.gradeCode,
    required this.remark,
    required this.isPassing,
  });

  final ExamTrack track;
  final int rawCorrect;
  final int totalQuestions;
  final double percentage;
  final int scaledScore;
  final int scaledMax;
  final String gradeCode;
  final String remark;
  final bool isPassing;
}

class GradingEngine {
  static GradeResult grade({
    required ExamTrack track,
    required int rawCorrect,
    required int totalQuestions,
  }) {
    final safeTotal = totalQuestions <= 0 ? 1 : totalQuestions;
    final safeCorrect = rawCorrect.clamp(0, safeTotal);
    final pct = (safeCorrect / safeTotal) * 100.0;

    return switch (track) {
      ExamTrack.ncee => _gradeNcee(safeCorrect, safeTotal, pct),
      ExamTrack.bece => _gradeBece(safeCorrect, safeTotal, pct),
      ExamTrack.waecNeco => _gradeWaecNeco(safeCorrect, safeTotal, pct),
      ExamTrack.jambUtme => _gradeJamb(safeCorrect, safeTotal, pct),
    };
  }

  static GradeResult _gradeNcee(int correct, int total, double pct) {
    final scaled = ((pct / 100.0) * 200).round();
    final (code, remark, pass) = switch (scaled) {
      >= 150 => ('Merit', 'Unity School Competitive', true),
      >= 120 => ('Pass', 'Strong Foundation', true),
      >= 100 => ('Borderline', 'Needs Guided Practice', true),
      _ => ('Review', 'Rebuild Core Concepts', false),
    };
    return GradeResult(
      track: ExamTrack.ncee,
      rawCorrect: correct,
      totalQuestions: total,
      percentage: pct,
      scaledScore: scaled,
      scaledMax: 200,
      gradeCode: code,
      remark: remark,
      isPassing: pass,
    );
  }

  static GradeResult _gradeBece(int correct, int total, double pct) {
    final scaled = pct.round();
    final (code, remark, pass) = switch (pct) {
      >= 75 => ('Distinction', 'Excellent JSS Mastery', true),
      >= 55 => ('Credit', 'Ready for Senior Secondary', true),
      >= 40 => ('Pass', 'Basic Competency Met', true),
      _ => ('Fail', 'Needs Topic Remediation', false),
    };
    return GradeResult(
      track: ExamTrack.bece,
      rawCorrect: correct,
      totalQuestions: total,
      percentage: pct,
      scaledScore: scaled,
      scaledMax: 100,
      gradeCode: code,
      remark: remark,
      isPassing: pass,
    );
  }

  static GradeResult _gradeWaecNeco(int correct, int total, double pct) {
    final scaled = pct.round();
    final (code, remark, pass) = switch (pct) {
      >= 75 => ('A1', 'Distinction', true),
      >= 70 => ('B2', 'Very Good', true),
      >= 65 => ('B3', 'Good', true),
      >= 60 => ('C4', 'Credit', true),
      >= 55 => ('C5', 'Credit', true),
      >= 50 => ('C6', 'Credit', true),
      >= 45 => ('D7', 'Pass', false),
      >= 40 => ('E8', 'Pass', false),
      _ => ('F9', 'Fail', false),
    };
    return GradeResult(
      track: ExamTrack.waecNeco,
      rawCorrect: correct,
      totalQuestions: total,
      percentage: pct,
      scaledScore: scaled,
      scaledMax: 100,
      gradeCode: code,
      remark: remark,
      isPassing: pass,
    );
  }

  static GradeResult _gradeJamb(int correct, int total, double pct) {
    final scaled = ((pct / 100.0) * 400).round();
    final (code, remark, pass) = switch (scaled) {
      >= 280 => ('280+', 'Competitive Merit Tier', true),
      >= 220 => ('220+', 'Strong University Cut-off', true),
      >= 180 => ('180+', 'Baseline UTME Cut-off', true),
      _ => ('<180', 'Boost Weak Subjects', false),
    };
    return GradeResult(
      track: ExamTrack.jambUtme,
      rawCorrect: correct,
      totalQuestions: total,
      percentage: pct,
      scaledScore: scaled,
      scaledMax: 400,
      gradeCode: code,
      remark: remark,
      isPassing: pass,
    );
  }
}
