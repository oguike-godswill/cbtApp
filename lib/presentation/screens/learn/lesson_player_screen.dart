import 'dart:convert';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/db/app_database.dart';
import '../../providers/app_providers.dart';
import '../../widgets/interactive_visualizer.dart';
import '../../widgets/math_markdown_view.dart';
import '../../widgets/rough_work_scratchpad.dart';
import '../../widgets/tutor_bottom_sheet.dart';

class LessonPlayerScreen extends ConsumerStatefulWidget {
  const LessonPlayerScreen({super.key, required this.lessonId});

  final String lessonId;

  @override
  ConsumerState<LessonPlayerScreen> createState() => _LessonPlayerScreenState();
}

class _LessonPlayerScreenState extends ConsumerState<LessonPlayerScreen> {
  bool _explainSimply = true;
  bool _showScratchpad = false;
  final Map<String, int> _revealedCounts = {};
  final Map<String, int> _checkpointSelections = {};
  final FlutterTts _tts = FlutterTts();
  bool _speaking = false;

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('en-NG');
    _tts.setSpeechRate(0.48);
    _tts.setCompletionHandler(() {
      if (mounted) setState(() => _speaking = false);
    });
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    if (_speaking) {
      await _tts.stop();
      if (mounted) setState(() => _speaking = false);
      return;
    }
    setState(() => _speaking = true);
    await _tts.speak(text.replaceAll(r'$', ''));
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);

    return FutureBuilder<(Lesson?, List<LessonStep>, List<Question>)>(
      future: _loadLessonBundle(db),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final (lesson, steps, relatedQuestions) = snapshot.data!;
        if (lesson == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Lesson Not Found')),
            body: const Center(child: Text('Could not locate this lesson.')),
          );
        }

        final keyRules = _decodeStringList(lesson.keyRulesJson);
        final summary = _explainSimply
            ? lesson.simpleSummaryMarkdown
            : lesson.formalSummaryMarkdown;

        return Scaffold(
          appBar: AppBar(
            title: Text(lesson.title, overflow: TextOverflow.ellipsis),
            actions: [
              IconButton(
                tooltip: 'Rough-Work Scratchpad',
                onPressed: () =>
                    setState(() => _showScratchpad = !_showScratchpad),
                icon: Icon(
                  Icons.draw_outlined,
                  color: _showScratchpad ? context.naija.emerald : null,
                ),
              ),
              IconButton(
                tooltip: _speaking ? 'Stop Audio' : 'Read Aloud',
                onPressed: () => _speak(summary),
                icon: Icon(_speaking ? Icons.stop_circle_outlined : Icons.volume_up_outlined),
              ),
              IconButton(
                tooltip: 'Bookmark Lesson',
                onPressed: () async {
                  await (db.update(db.lessons)
                        ..where((t) => t.id.equals(lesson.id)))
                      .write(LessonsCompanion(
                          isBookmarked: Value(!lesson.isBookmarked)));
                  setState(() {});
                },
                icon: Icon(
                  lesson.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: lesson.isBookmarked ? context.naija.emerald : null,
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${lesson.moduleTitle} · ${lesson.estimatedMinutes} min',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SegmentedButton<bool>(
                        segments: const [
                          ButtonSegment(value: true, label: Text('Simple')),
                          ButtonSegment(value: false, label: Text('Formal')),
                        ],
                        selected: {_explainSimply},
                        onSelectionChanged: (val) =>
                            setState(() => _explainSimply = val.first),
                        style: SegmentedButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _explainSimply
                                ? 'Plain-Language Explanation'
                                : 'Formal NERDC / WAEC Definition',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: context.naija.emerald,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 8),
                          MathMarkdownView(content: summary),
                        ],
                      ),
                    ),
                  ),
                  if (keyRules.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Key Exam Rules',
                                style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 8),
                            for (final rule in keyRules)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: Text('• $rule')),
                                    IconButton(
                                      tooltip: 'Save Rule to Flashcards',
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () async {
                                        await db.into(db.flashcards).insertOnConflictUpdate(
                                              FlashcardsCompanion(
                                                id: Value('${lesson.id}_${rule.hashCode}'),
                                                lessonId: Value(lesson.id),
                                                subjectTitle: Value(lesson.title),
                                                ruleText: Value(rule),
                                                createdAt: Value(DateTime.now()),
                                              ),
                                            );
                                        ref.invalidate(flashcardsProvider);
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Saved rule to Flashcards'),
                                            ),
                                          );
                                        }
                                      },
                                      icon: Icon(
                                        Icons.style_outlined,
                                        size: 18,
                                        color: context.naija.emerald,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 14),
                  for (final step in steps) ...[
                    _buildStepCard(context, step),
                    const SizedBox(height: 12),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            builder: (_) => TutorBottomSheet(
                              contextTitle: lesson.title,
                              contextBody: lesson.formalSummaryMarkdown,
                            ),
                          ),
                          icon: const Icon(Icons.auto_awesome),
                          label: const Text('Ask AI Tutor'),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(48, 48),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () async {
                            await db.recordLessonStepProgress(
                              lessonId: lesson.id,
                              completedSteps: steps.length,
                              totalSteps: steps.isEmpty ? 1 : steps.length,
                              isCompleted: true,
                            );
                            ref.invalidate(lessonProgressMapProvider);
                            ref.invalidate(dailyPlanProvider);
                            if (context.mounted) {
                              if (relatedQuestions.isNotEmpty) {
                                context.push(
                                  '/exam',
                                  extra: {
                                    'track': 'waec_neco',
                                    'mode': 'study',
                                    'title': '${lesson.title} Practice',
                                    'questionIds': relatedQuestions
                                        .map((q) => q.id)
                                        .toList(),
                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Lesson marked as mastered!'),
                                  ),
                                );
                              }
                            }
                          },
                          icon: const Icon(Icons.check_circle_outline),
                          label: Text(
                            relatedQuestions.isNotEmpty
                                ? 'Practice (${relatedQuestions.length})'
                                : 'Complete Lesson',
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor: context.naija.emerald,
                            minimumSize: const Size(48, 48),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
              if (_showScratchpad)
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  height: 300,
                  child: RoughWorkScratchpad(
                    scopeKey: lesson.id,
                    onClose: () => setState(() => _showScratchpad = false),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStepCard(BuildContext context, LessonStep step) {
    if (step.stepType == 'interactive_sim') {
      final config = jsonDecode(step.simConfigJson) as Map<String, dynamic>;
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MathMarkdownView(content: step.contentMarkdown),
              const SizedBox(height: 12),
              InteractiveVisualizer(simConfig: config),
            ],
          ),
        ),
      );
    }

    if (step.stepType == 'oral_drill') {
      final config = jsonDecode(step.simConfigJson) as Map<String, dynamic>;
      final items = (config['items'] as List?) ?? const [];
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MathMarkdownView(content: step.contentMarkdown),
              const SizedBox(height: 10),
              for (final raw in items) ...[
                _OralDrillRow(
                  word: raw['word'].toString(),
                  ipa: raw['ipa'].toString(),
                  contrast: raw['contrast'].toString(),
                  rule: raw['rule'].toString(),
                  onSpeak: () => _speak(raw['word'].toString()),
                ),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ),
      );
    }

    if (step.stepType == 'worked_example') {
      final revealSteps = _decodeStringList(step.revealStepsJson);
      final revealed = _revealedCounts[step.id] ?? 1;
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MathMarkdownView(content: step.contentMarkdown),
              const SizedBox(height: 10),
              for (var i = 0; i < revealed && i < revealSteps.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: context.naija.canvas,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: context.naija.border),
                    ),
                    child: MathMarkdownView(
                      content: '**Step ${i + 1}:** ${revealSteps[i]}',
                    ),
                  ),
                ),
              if (revealed < revealSteps.length)
                OutlinedButton.icon(
                  onPressed: () =>
                      setState(() => _revealedCounts[step.id] = revealed + 1),
                  icon: const Icon(Icons.visibility_outlined, size: 18),
                  label: Text('Reveal Next Step ($revealed/${revealSteps.length})'),
                ),
            ],
          ),
        ),
      );
    }

    if (step.stepType == 'checkpoint') {
      final cp = jsonDecode(step.checkpointQuestionJson) as Map<String, dynamic>;
      final options = (cp['options'] as List?)?.map((e) => e.toString()).toList() ?? const [];
      final correctIdx = (cp['correctIndex'] as num?)?.toInt() ?? 0;
      final selected = _checkpointSelections[step.id];

      return Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MathMarkdownView(content: step.contentMarkdown),
              const SizedBox(height: 6),
              MathMarkdownView(content: cp['prompt']?.toString() ?? ''),
              const SizedBox(height: 10),
              for (var i = 0; i < options.length; i++)
                RadioListTile<int>(
                  value: i,
                  groupValue: selected,
                  title: Text(options[i]),
                  dense: true,
                  onChanged: (v) =>
                      setState(() => _checkpointSelections[step.id] = v ?? i),
                ),
              if (selected != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: selected == correctIdx
                        ? context.naija.emeraldSoft
                        : context.naija.coralSoft,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selected == correctIdx ? Icons.check_circle : Icons.cancel,
                        color: selected == correctIdx
                            ? context.naija.emerald
                            : context.naija.coral,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(cp['explanation']?.toString() ?? ''),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: MathMarkdownView(content: step.contentMarkdown),
      ),
    );
  }

  Future<(Lesson?, List<LessonStep>, List<Question>)> _loadLessonBundle(
    AppDatabase db,
  ) async {
    final lesson = await (db.select(db.lessons)
          ..where((t) => t.id.equals(widget.lessonId)))
        .getSingleOrNull();
    if (lesson == null) return (null, const <LessonStep>[], const <Question>[]);

    final steps = await (db.select(db.lessonSteps)
          ..where((t) => t.lessonId.equals(widget.lessonId))
          ..orderBy([(t) => OrderingTerm.asc(t.stepOrder)]))
        .get();

    final questions = await (db.select(db.questions)
          ..where((t) => t.relatedLessonId.equals(widget.lessonId)))
        .get();

    return (lesson, steps, questions);
  }

  List<String> _decodeStringList(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List) return decoded.map((e) => e.toString()).toList();
    } catch (_) {}
    return const [];
  }
}

class _OralDrillRow extends StatelessWidget {
  const _OralDrillRow({
    required this.word,
    required this.ipa,
    required this.contrast,
    required this.rule,
    required this.onSpeak,
  });

  final String word;
  final String ipa;
  final String contrast;
  final String rule;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.naija.canvas,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.naija.border),
      ),
      child: Row(
        children: [
          IconButton.filledTonal(
            onPressed: onSpeak,
            icon: Icon(Icons.volume_up, color: context.naija.emerald),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$word  $ipa  ·  vs $contrast',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(rule, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
