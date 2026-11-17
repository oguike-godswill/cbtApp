import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/models/exam_track.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/db/app_database.dart';
import '../../../domain/grading/grading_engine.dart';
import '../../providers/app_providers.dart';
import '../../widgets/math_markdown_view.dart';
import '../../widgets/rough_work_scratchpad.dart';
import '../../widgets/tutor_bottom_sheet.dart';

class ExamSimulatorScreen extends ConsumerStatefulWidget {
  const ExamSimulatorScreen({
    super.key,
    this.sessionId,
    this.durationMinutes,
    required this.track,
    required this.mode,
    required this.title,
    required this.questionIds,
  });

  final String? sessionId;
  final int? durationMinutes;
  final ExamTrack track;
  final String mode; // 'study' | 'timed'
  final String title;
  final List<String> questionIds;

  @override
  ConsumerState<ExamSimulatorScreen> createState() =>
      _ExamSimulatorScreenState();
}

class _ExamSimulatorScreenState extends ConsumerState<ExamSimulatorScreen> {
  List<Question> _questions = const [];
  Map<String, String> _packCodeByPackId = const {};
  bool _loading = true;
  int _currentIndex = 0;
  final Map<String, int> _answers = {};
  final Set<String> _flagged = {};
  final Set<String> _checkedStudy = {};
  bool _showScratchpad = false;
  bool _submitted = false;
  GradeResult? _gradeResult;
  Timer? _timer;
  int _remainingSeconds = 0;
  late final String _sessionId;
  final FocusNode _keyboardFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _sessionId =
        widget.sessionId ?? 'sess_${DateTime.now().millisecondsSinceEpoch}';
    _remainingSeconds = widget.durationMinutes != null
        ? widget.durationMinutes! * 60
        : (widget.track == ExamTrack.jambUtme ? 120 * 60 : 45 * 60);
    _loadQuestionsAndSession();
    if (widget.mode == 'timed') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(examLockProvider.notifier).state = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted || _submitted) return;
        if (_remainingSeconds <= 1) {
          _submitExam();
        } else {
          setState(() => _remainingSeconds--);
          if (_remainingSeconds % 10 == 0) {
            _persistActiveSession();
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _keyboardFocus.dispose();
    if (widget.mode == 'timed') {
      Future.microtask(() {
        if (mounted) ref.read(examLockProvider.notifier).state = false;
      });
    }
    super.dispose();
  }

  Future<void> _loadQuestionsAndSession() async {
    final db = ref.read(databaseProvider);
    final all = await db.select(db.questions).get();
    final packs = await db.select(db.subjectPacks).get();
    final packMap = {for (final p in packs) p.id: p.subjectCode};

    final map = {for (final q in all) q.id: q};
    final ordered = <Question>[];
    for (final id in widget.questionIds) {
      final q = map[id];
      if (q != null) ordered.add(q);
    }
    if (ordered.isEmpty) ordered.addAll(all.take(5));

    if (widget.sessionId != null) {
      final saved = await (db.select(db.activeExamSessions)
            ..where((t) => t.id.equals(widget.sessionId!)))
          .getSingleOrNull();
      if (saved != null) {
        final decoded = jsonDecode(saved.answersJson) as Map<String, dynamic>;
        for (final entry in decoded.entries) {
          _answers[entry.key] = (entry.value as num).toInt();
        }
        _remainingSeconds = saved.remainingSeconds;
        _currentIndex = saved.currentIndex.clamp(0, ordered.length - 1);
      }
    }

    if (mounted) {
      setState(() {
        _questions = ordered;
        _packCodeByPackId = packMap;
        _loading = false;
      });
    }
  }

  Future<void> _persistActiveSession() async {
    if (_questions.isEmpty || _submitted) return;
    final db = ref.read(databaseProvider);
    await db.saveActiveSession(
      id: _sessionId,
      track: widget.track.id,
      mode: widget.mode,
      title: widget.title,
      questionIds: _questions.map((q) => q.id).toList(),
      answers: _answers,
      remainingSeconds: _remainingSeconds,
      currentIndex: _currentIndex,
    );
    ref.invalidate(activeExamSessionProvider);
  }

  Future<void> _submitExam() async {
    if (_submitted || _questions.isEmpty) return;
    _timer?.cancel();
    ref.read(examLockProvider.notifier).state = false;

    final db = ref.read(databaseProvider);
    await db.deleteActiveSession(_sessionId);
    ref.invalidate(activeExamSessionProvider);

    var correct = 0;
    for (final q in _questions) {
      final ans = _answers[q.id];
      final isRight = ans == q.correctIndex;
      if (isRight) correct++;
      if (ans != null) {
        await recordQuestionOutcomeInVault(
          db: db,
          ref: ref,
          questionId: q.id,
          isCorrect: isRight,
        );
      }
    }

    final result = GradingEngine.grade(
      track: widget.track,
      rawCorrect: correct,
      totalQuestions: _questions.length,
    );

    await db.into(db.examAttempts).insert(
          ExamAttemptsCompanion.insert(
            id: 'att_${DateTime.now().millisecondsSinceEpoch}',
            track: widget.track.id,
            title: widget.title,
            rawCorrect: result.rawCorrect,
            totalQuestions: result.totalQuestions,
            scaledScore: result.scaledScore,
            scaledMax: result.scaledMax,
            gradeCode: result.gradeCode,
            completedAt: DateTime.now(),
          ),
        );
    ref.invalidate(examAttemptsProvider);
    ref.invalidate(dailyPlanProvider);

    if (mounted) {
      setState(() {
        _submitted = true;
        _gradeResult = result;
      });
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is! KeyDownEvent || _submitted || _questions.isEmpty) return;
    final q = _questions[_currentIndex];
    final options = _decodeList(q.optionsJson);
    final showExplanation =
        widget.mode == 'study' && _checkedStudy.contains(q.id);

    final key = event.logicalKey;
    if (!showExplanation) {
      final idx = switch (key) {
        LogicalKeyboardKey.keyA => 0,
        LogicalKeyboardKey.keyB => 1,
        LogicalKeyboardKey.keyC => 2,
        LogicalKeyboardKey.keyD => 3,
        _ => -1,
      };
      if (idx >= 0 && idx < options.length) {
        setState(() => _answers[q.id] = idx);
        _persistActiveSession();
        return;
      }
    }

    if (key == LogicalKeyboardKey.arrowRight || key == LogicalKeyboardKey.keyN) {
      if (_currentIndex < _questions.length - 1) {
        setState(() => _currentIndex++);
        _persistActiveSession();
      }
    } else if (key == LogicalKeyboardKey.arrowLeft ||
        key == LogicalKeyboardKey.keyP) {
      if (_currentIndex > 0) {
        setState(() => _currentIndex--);
        _persistActiveSession();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: Text('No questions available.')),
      );
    }

    if (_submitted && _gradeResult != null) {
      return _buildResultScreen(context, _gradeResult!);
    }

    final q = _questions[_currentIndex];
    final options = _decodeList(q.optionsJson);
    final selected = _answers[q.id];
    final showExplanation =
        widget.mode == 'study' && _checkedStudy.contains(q.id);
    final (passage, stem) = _extractPassage(q.stemMarkdown);

    // Build subject groups for 4-subject JAMB tab bar
    final subjectEntries = <(String packId, String code, int firstIdx, int count)>[];
    final seenPacks = <String>{};
    for (var i = 0; i < _questions.length; i++) {
      final pid = _questions[i].packId;
      if (seenPacks.add(pid)) {
        final code = _packCodeByPackId[pid] ?? pid;
        final cnt = _questions.where((item) => item.packId == pid).length;
        subjectEntries.add((pid, code, i, cnt));
      }
    }

    return PopScope(
      canPop: widget.mode != 'timed',
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        await _persistActiveSession();
        if (!context.mounted) return;
        final leave = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Pause & Save Exam?'),
            content: const Text(
              'Your answers and remaining time are saved. You can resume anytime from Home or Practice.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Stay'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Save & Exit'),
              ),
            ],
          ),
        );
        if (leave == true && context.mounted) {
          ref.read(examLockProvider.notifier).state = false;
          context.pop();
        }
      },
      child: KeyboardListener(
        focusNode: _keyboardFocus,
        autofocus: true,
        onKeyEvent: _handleKeyEvent,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Q${_currentIndex + 1}/${_questions.length} · ${q.examBody} ${q.examYear}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              if (widget.mode == 'timed')
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      _formatDuration(_remainingSeconds),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.merge(AppTheme.monoTabular)
                          .copyWith(color: context.naija.emerald),
                    ),
                  ),
                ),
              IconButton(
                tooltip: 'Calculator',
                onPressed: () => _showCalculatorDialog(context),
                icon: const Icon(Icons.calculate_outlined),
              ),
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
                tooltip: 'Question Palette',
                onPressed: () => _showPaletteModal(context),
                icon: const Icon(Icons.grid_view),
              ),
            ],
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  if (subjectEntries.length > 1)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: context.naija.surface,
                        border: Border(
                            bottom: BorderSide(color: context.naija.border)),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final entry in subjectEntries) ...[
                              ChoiceChip(
                                label: Text('${entry.$2} (${entry.$4})'),
                                selected: q.packId == entry.$1,
                                selectedColor: context.naija.emeraldSoft,
                                onSelected: (_) {
                                  setState(() => _currentIndex = entry.$3);
                                  _persistActiveSession();
                                },
                              ),
                              const SizedBox(width: 8),
                            ],
                          ],
                        ),
                      ),
                    ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth >= 840;
                        final mainQuestionList = ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                        Row(
                          children: [
                            Text(
                              '${q.paperType.toUpperCase()} · ${q.difficulty.toUpperCase()}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const Spacer(),
                            IconButton(
                              tooltip: 'Flag for review',
                              onPressed: () {
                                setState(() {
                                  if (_flagged.contains(q.id)) {
                                    _flagged.remove(q.id);
                                  } else {
                                    _flagged.add(q.id);
                                  }
                                });
                              },
                              icon: Icon(
                                _flagged.contains(q.id)
                                    ? Icons.flag
                                    : Icons.flag_outlined,
                                color: _flagged.contains(q.id)
                                    ? context.naija.amber
                                    : context.naija.mutedInk,
                              ),
                            ),
                          ],
                        ),
                        if (passage != null) ...[
                          Container(
                            constraints: const BoxConstraints(maxHeight: 160),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: context.naija.amberSoft.withValues(alpha: 0.45),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: context.naija.border),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reading Passage',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 6),
                                  MathMarkdownView(content: passage),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: MathMarkdownView(content: stem),
                          ),
                        ),
                        const SizedBox(height: 12),
                        for (var i = 0; i < options.length; i++) ...[
                          _OptionTile(
                            label: String.fromCharCode(65 + i),
                            content: options[i],
                            isSelected: selected == i,
                            showResult: showExplanation,
                            isCorrectOption: i == q.correctIndex,
                            onTap: showExplanation
                                ? null
                                : () {
                                    setState(() => _answers[q.id] = i);
                                    _persistActiveSession();
                                  },
                          ),
                          const SizedBox(height: 8),
                        ],
                        if (widget.mode == 'study' && !showExplanation)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: FilledButton(
                              onPressed: selected == null
                                  ? null
                                  : () async {
                                      final db = ref.read(databaseProvider);
                                      await recordQuestionOutcomeInVault(
                                        db: db,
                                        ref: ref,
                                        questionId: q.id,
                                        isCorrect: selected == q.correctIndex,
                                      );
                                      setState(() => _checkedStudy.add(q.id));
                                    },
                              style: FilledButton.styleFrom(
                                backgroundColor: context.naija.emerald,
                                minimumSize: const Size(double.infinity, 48),
                              ),
                              child: const Text('Check Answer & Explanation'),
                            ),
                          ),
                        if (showExplanation) ...[
                          const SizedBox(height: 12),
                          _DetailedExplanationCard(
                            question: q,
                            selectedIndex: selected,
                            onReviewLesson: () =>
                                context.push('/lesson/${q.relatedLessonId}'),
                            onAskTutor: () => showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) => TutorBottomSheet(
                                contextTitle: '${q.examBody} ${q.examYear}',
                                contextBody:
                                    '$stem\nAnswer: ${q.answerSummary}',
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 20),
                          ],
                        );

                        if (!isWide) return mainQuestionList;

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 5, child: mainQuestionList),
                            VerticalDivider(width: 1, color: context.naija.border),
                            Expanded(
                              flex: 3,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Question Palette (${_answers.length}/${_questions.length})',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        for (var i = 0; i < _questions.length; i++)
                                          InkWell(
                                            onTap: () {
                                              setState(() => _currentIndex = i);
                                              _persistActiveSession();
                                            },
                                            child: Container(
                                              width: 42,
                                              height: 42,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: _answers.containsKey(_questions[i].id)
                                                    ? context.naija.emeraldSoft
                                                    : context.naija.canvas,
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: i == _currentIndex
                                                      ? context.naija.emerald
                                                      : _flagged.contains(_questions[i].id)
                                                          ? context.naija.amber
                                                          : context.naija.border,
                                                  width: i == _currentIndex ? 2 : 1,
                                                ),
                                              ),
                                              child: Text('${i + 1}', style: AppTheme.monoTabular),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (_showScratchpad)
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  height: 280,
                  child: RoughWorkScratchpad(
                    scopeKey: q.id,
                    onClose: () => setState(() => _showScratchpad = false),
                  ),
                ),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: context.naija.surface,
                border: Border(top: BorderSide(color: context.naija.border)),
              ),
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: _currentIndex > 0
                        ? () {
                            setState(() => _currentIndex--);
                            _persistActiveSession();
                          }
                        : null,
                    child: const Text('Previous'),
                  ),
                  const Spacer(),
                  if (_currentIndex < _questions.length - 1)
                    FilledButton(
                      onPressed: () {
                        setState(() => _currentIndex++);
                        _persistActiveSession();
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: context.naija.emerald,
                      ),
                      child: const Text('Next'),
                    )
                  else
                    FilledButton(
                      onPressed: _submitExam,
                      style: FilledButton.styleFrom(
                        backgroundColor: context.naija.emerald,
                      ),
                      child: const Text('Submit & Grade'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  (String?, String) _extractPassage(String raw) {
    final regex = RegExp(r'\[PASSAGE\]([\s\S]*?)\[/PASSAGE\]');
    final match = regex.firstMatch(raw);
    if (match == null) return (null, raw);
    final passage = match.group(1)?.trim();
    final stem = raw.replaceFirst(regex, '').trim();
    return (passage, stem);
  }

  Widget _buildResultScreen(BuildContext context, GradeResult res) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Results')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Text(
                    res.gradeCode,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.merge(AppTheme.monoTabular)
                        .copyWith(
                          fontSize: 36,
                          color: res.isPassing
                              ? context.naija.emerald
                              : context.naija.coral,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(res.remark, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    'Scaled: ${res.scaledScore}/${res.scaledMax}  ·  Raw: ${res.rawCorrect}/${res.totalQuestions} (${res.percentage.toStringAsFixed(0)}%)',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.merge(AppTheme.monoTabular),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Question-by-Question Review',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          for (var i = 0; i < _questions.length; i++) ...[
            _DetailedExplanationCard(
              question: _questions[i],
              selectedIndex: _answers[_questions[i].id],
              headerPrefix: 'Q${i + 1}: ',
              onReviewLesson: () =>
                  context.push('/lesson/${_questions[i].relatedLessonId}'),
              onAskTutor: () => showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (_) => TutorBottomSheet(
                  contextTitle:
                      '${_questions[i].examBody} ${_questions[i].examYear}',
                  contextBody: _questions[i].stemMarkdown,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  void _showPaletteModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (var i = 0; i < _questions.length; i++)
              InkWell(
                onTap: () {
                  setState(() => _currentIndex = i);
                  Navigator.pop(ctx);
                },
                child: Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _answers.containsKey(_questions[i].id)
                        ? context.naija.emeraldSoft
                        : context.naija.canvas,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: i == _currentIndex
                          ? context.naija.emerald
                          : _flagged.contains(_questions[i].id)
                              ? context.naija.amber
                              : context.naija.border,
                      width: i == _currentIndex ? 2 : 1,
                    ),
                  ),
                  child: Text('${i + 1}', style: AppTheme.monoTabular),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showCalculatorDialog(BuildContext context) {
    var display = '0';
    var stored = 0.0;
    var pendingOp = '';
    showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setCalc) {
          void pressDigit(String d) {
            setCalc(() {
              display = display == '0' ? d : '$display$d';
            });
          }

          void applyOp(String op) {
            setCalc(() {
              stored = double.tryParse(display) ?? 0;
              pendingOp = op;
              display = '0';
            });
          }

          void evaluate() {
            final curr = double.tryParse(display) ?? 0;
            var res = curr;
            if (pendingOp == '+') res = stored + curr;
            if (pendingOp == '-') res = stored - curr;
            if (pendingOp == '×') res = stored * curr;
            if (pendingOp == '÷' && curr != 0) res = stored / curr;
            setCalc(() {
              display =
                  res.toStringAsFixed(res.truncateToDouble() == res ? 0 : 4);
              pendingOp = '';
            });
          }

          return AlertDialog(
            title: const Text('CBT Calculator'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: context.naija.canvas,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.naija.border),
                  ),
                  child: Text(
                    display,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.merge(AppTheme.monoTabular),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final k in [
                      '7', '8', '9', '÷',
                      '4', '5', '6', '×',
                      '1', '2', '3', '-',
                      '0', '.', '=', '+'
                    ])
                      SizedBox(
                        width: 54,
                        height: 44,
                        child: OutlinedButton(
                          onPressed: () {
                            if (k == '=') {
                              evaluate();
                            } else if ('+-×÷'.contains(k)) {
                              applyOp(k);
                            } else {
                              pressDigit(k);
                            }
                          },
                          child: Text(k),
                        ),
                      ),
                    SizedBox(
                      width: 114,
                      height: 44,
                      child: OutlinedButton(
                        onPressed: () {
                          final v = double.tryParse(display) ?? 0;
                          setCalc(() =>
                              display = math.sqrt(v.abs()).toStringAsFixed(4));
                        },
                        child: const Text('√x'),
                      ),
                    ),
                    SizedBox(
                      width: 114,
                      height: 44,
                      child: OutlinedButton(
                        onPressed: () => setCalc(() {
                          display = '0';
                          stored = 0;
                          pendingOp = '';
                        }),
                        child: const Text('CLR'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Close'),
              ),
            ],
          );
        },
      ),
    );
  }

  String _formatDuration(int totalSeconds) {
    final m = totalSeconds ~/ 60;
    final s = totalSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  List<String> _decodeList(String raw) {
    try {
      final d = jsonDecode(raw);
      if (d is List) return d.map((e) => e.toString()).toList();
    } catch (_) {}
    return const [];
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    required this.content,
    required this.isSelected,
    required this.showResult,
    required this.isCorrectOption,
    this.onTap,
  });

  final String label;
  final String content;
  final bool isSelected;
  final bool showResult;
  final bool isCorrectOption;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Color borderColor = context.naija.border;
    Color bg = context.naija.surface;

    if (showResult) {
      if (isCorrectOption) {
        borderColor = context.naija.emerald;
        bg = context.naija.emeraldSoft;
      } else if (isSelected && !isCorrectOption) {
        borderColor = context.naija.coral;
        bg = context.naija.coralSoft;
      }
    } else if (isSelected) {
      borderColor = context.naija.emerald;
      bg = context.naija.emeraldSoft;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: isSelected ? 1.6 : 1),
        ),
        child: Row(
          children: [
            Text(
              '$label.',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.merge(AppTheme.monoTabular),
            ),
            const SizedBox(width: 10),
            Expanded(child: MathMarkdownView(content: content)),
          ],
        ),
      ),
    );
  }
}

class _DetailedExplanationCard extends StatefulWidget {
  const _DetailedExplanationCard({
    required this.question,
    required this.selectedIndex,
    required this.onReviewLesson,
    required this.onAskTutor,
    this.headerPrefix = '',
  });

  final Question question;
  final int? selectedIndex;
  final VoidCallback onReviewLesson;
  final VoidCallback onAskTutor;
  final String headerPrefix;

  @override
  State<_DetailedExplanationCard> createState() =>
      _DetailedExplanationCardState();
}

class _DetailedExplanationCardState extends State<_DetailedExplanationCard> {
  final Set<int> _checkedMarkingPoints = {};

  @override
  Widget build(BuildContext context) {
    final q = widget.question;
    final isCorrect = widget.selectedIndex == q.correctIndex;
    final worked = (jsonDecode(q.workedStepsJson) as List)
        .map((e) => e.toString())
        .toList();
    final distractors =
        jsonDecode(q.distractorNotesJson) as Map<String, dynamic>;
    final marking = (jsonDecode(q.markingPointsJson) as List)
        .map((e) => e.toString())
        .toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect ? context.naija.emerald : context.naija.coral,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${widget.headerPrefix}Answer: ${q.answerSummary}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: isCorrect
                              ? context.naija.emerald
                              : context.naija.coral,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('Step-by-Step Working',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            for (var i = 0; i < worked.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: MathMarkdownView(content: '${i + 1}. ${worked[i]}'),
              ),
            const SizedBox(height: 10),
            Text('Why Other Options Fail',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            for (final entry in distractors.entries)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: MathMarkdownView(
                  content:
                      '• Option ${String.fromCharCode(65 + (int.tryParse(entry.key) ?? 0))}: ${entry.value}',
                ),
              ),
            if (marking.isNotEmpty) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('WAEC Theory Self-Marking',
                      style: Theme.of(context).textTheme.titleMedium),
                  const Spacer(),
                  Text(
                    '${_checkedMarkingPoints.length}/${marking.length} marks',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.merge(AppTheme.monoTabular)
                        .copyWith(color: context.naija.emerald),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              for (var i = 0; i < marking.length; i++)
                CheckboxListTile(
                  value: _checkedMarkingPoints.contains(i),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(marking[i]),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _checkedMarkingPoints.add(i);
                      } else {
                        _checkedMarkingPoints.remove(i);
                      }
                    });
                  },
                ),
            ],
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.naija.amberSoft,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.lightbulb_outline,
                      size: 18, color: context.naija.amber),
                  const SizedBox(width: 8),
                  Expanded(child: Text('Examiner Tip: ${q.examinerTip}')),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: widget.onReviewLesson,
                  icon: const Icon(Icons.menu_book_outlined, size: 16),
                  label: const Text('Review Lesson'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: widget.onAskTutor,
                  icon: const Icon(Icons.auto_awesome, size: 16),
                  label: const Text('Ask AI Tutor'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
