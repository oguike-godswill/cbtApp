class Sm2State {
  const Sm2State({
    required this.easeFactor,
    required this.intervalDays,
    required this.repetitions,
    required this.nextReviewAt,
    required this.lastOutcome,
  });

  final double easeFactor;
  final int intervalDays;
  final int repetitions;
  final DateTime nextReviewAt;
  final String lastOutcome; // 'wrong' | 'hard' | 'good'

  bool get isMastered => repetitions >= 2 && intervalDays >= 7;
}

class Sm2Scheduler {
  /// Updates an item's SM-2 spaced-repetition state based on review quality.
  /// - [isCorrect]: false resets repetitions to 0 and schedules 1-day review.
  /// - [quality]: 0..5 (defaults: 5 if fast/confident, 4 if good, 2 if wrong).
  static Sm2State schedule({
    Sm2State? current,
    required bool isCorrect,
    int? quality,
    DateTime? now,
  }) {
    final timestamp = now ?? DateTime.now();
    final prevEase = current?.easeFactor ?? 2.5;
    final prevReps = current?.repetitions ?? 0;
    final prevInterval = current?.intervalDays ?? 1;

    if (!isCorrect) {
      final nextEase = (prevEase - 0.2).clamp(1.3, 2.8);
      return Sm2State(
        easeFactor: nextEase,
        intervalDays: 1,
        repetitions: 0,
        nextReviewAt: timestamp.add(const Duration(days: 1)),
        lastOutcome: 'wrong',
      );
    }

    final q = (quality ?? 4).clamp(3, 5);
    final newReps = prevReps + 1;
    final int nextInterval;
    if (newReps == 1) {
      nextInterval = 1;
    } else if (newReps == 2) {
      nextInterval = 3;
    } else if (newReps == 3) {
      nextInterval = 7;
    } else {
      nextInterval = (prevInterval * prevEase).round().clamp(7, 180);
    }

    final delta = 0.1 - (5 - q) * (0.08 + (5 - q) * 0.02);
    final newEase = (prevEase + delta).clamp(1.3, 2.8);

    return Sm2State(
      easeFactor: newEase,
      intervalDays: nextInterval,
      repetitions: newReps,
      nextReviewAt: timestamp.add(Duration(days: nextInterval)),
      lastOutcome: q >= 4 ? 'good' : 'hard',
    );
  }
}
