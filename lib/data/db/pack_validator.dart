import 'dart:convert';
import 'package:crypto/crypto.dart';

class PackValidationException implements Exception {
  PackValidationException(this.message);
  final String message;

  @override
  String toString() => 'PackValidationException: $message';
}

class PackValidator {
  /// Verifies that every question in a pack obeys the strict Detailed Explanation Contract:
  /// - non-empty answerSummary
  /// - non-empty workedStepsJson (at least 1 step)
  /// - non-empty distractorNotesJson
  /// - non-empty relatedLessonId
  static void validatePackMap(Map<String, dynamic> packJson) {
    final id = (packJson['id'] ?? '').toString().trim();
    if (id.isEmpty) {
      throw PackValidationException('Pack id cannot be empty.');
    }

    final questions = packJson['questions'];
    if (questions is! List) {
      throw PackValidationException('Pack $id must include a questions list.');
    }

    for (final rawQ in questions) {
      final q = rawQ as Map<String, dynamic>;
      final qid = (q['id'] ?? 'unknown').toString();
      final answerSummary = (q['answerSummary'] ?? '').toString().trim();
      final relatedLessonId = (q['relatedLessonId'] ?? '').toString().trim();
      final examinerTip = (q['examinerTip'] ?? '').toString().trim();
      final workedSteps = q['workedSteps'];
      final distractorNotes = q['distractorNotes'];

      if (answerSummary.isEmpty) {
        throw PackValidationException('Question $qid missing answerSummary.');
      }
      if (relatedLessonId.isEmpty) {
        throw PackValidationException('Question $qid missing relatedLessonId.');
      }
      if (examinerTip.isEmpty) {
        throw PackValidationException('Question $qid missing examinerTip.');
      }
      if (workedSteps is! List || workedSteps.isEmpty) {
        throw PackValidationException('Question $qid must have at least 1 worked step.');
      }
      if (distractorNotes is! Map || distractorNotes.isEmpty) {
        throw PackValidationException('Question $qid must include distractorNotes.');
      }
    }
  }

  static String computeSha256(String content) {
    return sha256.convert(utf8.encode(content)).toString();
  }
}
