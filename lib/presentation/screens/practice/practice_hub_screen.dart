import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/models/exam_track.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/db/app_database.dart';
import '../../providers/app_providers.dart';

class PracticeHubScreen extends ConsumerWidget {
  const PracticeHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final attemptsAsync = ref.watch(examAttemptsProvider);
    final activeSessionAsync = ref.watch(activeExamSessionProvider);
    final packsAsync = ref.watch(subjectPacksProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Exam & CBT Simulator')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Choose Exam Mode', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            'Configure your own custom CBT test or launch a quick track mock.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 14),
          if (activeSessionAsync.valueOrNull != null) ...[
            Card(
              child: ListTile(
                leading: Icon(Icons.play_circle_fill, color: context.naija.amber),
                title: Text('Resume: ${activeSessionAsync.valueOrNull!.title}'),
                subtitle: Text(
                  '${activeSessionAsync.valueOrNull!.remainingSeconds ~/ 60} min left',
                ),
                trailing: FilledButton(
                  onPressed: () {
                    final s = activeSessionAsync.valueOrNull!;
                    final qIds = (jsonDecode(s.questionIdsJson) as List)
                        .map((e) => e.toString())
                        .toList();
                    context.push('/exam', extra: {
                      'sessionId': s.id,
                      'track': s.track,
                      'mode': s.mode,
                      'title': s.title,
                      'questionIds': qIds,
                    });
                  },
                  style: FilledButton.styleFrom(backgroundColor: context.naija.amber),
                  child: const Text('Resume'),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.tune, size: 18, color: context.naija.emerald),
                      const SizedBox(width: 6),
                      Text('Custom CBT Test Builder',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Pick your exact subjects (1 to 4+), question count (10–180), difficulty, paper type, and timer.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  FilledButton.icon(
                    onPressed: () {
                      final packs = packsAsync.valueOrNull ?? const <SubjectPack>[];
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => _CustomCbtBuilderSheet(
                          packs: packs,
                          db: db,
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: context.naija.emerald,
                      minimumSize: const Size(double.infinity, 46),
                    ),
                    icon: const Icon(Icons.playlist_add_check),
                    label: const Text('Configure Custom Test'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.view_week_outlined,
                          size: 18, color: context.naija.emerald),
                      const SizedBox(width: 6),
                      Text('Quick 4-Subject JAMB CBT Mock',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '40 shuffled questions across ENG · MTH · PHY · ECO (or BIO/CHM) with subject tabs and 400-mark scaling.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () async {
                      final combo = ref.read(jambComboProvider);
                      final ids = await _fetchQuickJambSample(db, combo);
                      if (context.mounted) {
                        context.push('/exam', extra: {
                          'track': ExamTrack.jambUtme.id,
                          'mode': 'timed',
                          'durationMinutes': 40,
                          'title': 'JAMB 4-Subject CBT (${combo.join("·")})',
                          'questionIds': ids,
                        });
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 44),
                    ),
                    child: const Text('Launch 40Q Multi-Subject CBT'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          for (final track in ExamTrack.values) ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(track.label,
                            style: Theme.of(context).textTheme.titleMedium),
                        const Spacer(),
                        Text(track.level,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(track.description,
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () async {
                              final ids = await _fetchQuestionIdsForTrack(db, track, limit: 20);
                              if (context.mounted) {
                                context.push('/exam', extra: {
                                  'track': track.id,
                                  'mode': 'study',
                                  'title': '${track.shortLabel} Study (20Q)',
                                  'questionIds': ids,
                                });
                              }
                            },
                            child: const Text('Study (20Q)'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FilledButton(
                            onPressed: () async {
                              final ids = await _fetchQuestionIdsForTrack(db, track, limit: 20);
                              if (context.mounted) {
                                context.push('/exam', extra: {
                                  'track': track.id,
                                  'mode': 'timed',
                                  'durationMinutes': 20,
                                  'title': '${track.shortLabel} Timed (20Q)',
                                  'questionIds': ids,
                                });
                              }
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: context.naija.emerald,
                            ),
                            child: const Text('Timed (20Q)'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
          const SizedBox(height: 10),
          Text('Recent Exam Attempts',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          attemptsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
            data: (attempts) {
              if (attempts.isEmpty) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'No completed mock exams yet. Configure a Custom CBT Test or start a quick mock above.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  for (final a in attempts.take(6)) ...[
                    Card(
                      child: ListTile(
                        title: Text(a.title),
                        subtitle: Text(
                          '${a.rawCorrect}/${a.totalQuestions} correct · ${DateFormat.MMMd().add_jm().format(a.completedAt)}',
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              a.gradeCode,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.merge(AppTheme.monoTabular)
                                  .copyWith(color: context.naija.emerald),
                            ),
                            Text(
                              '${a.scaledScore}/${a.scaledMax}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.merge(AppTheme.monoTabular),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Future<List<String>> _fetchQuickJambSample(
    AppDatabase db,
    List<String> combo,
  ) async {
    final rng = Random();
    final all = await db.select(db.questions).get();
    final targetPacks =
        combo.map((code) => 'pack_${code.toLowerCase()}_full_v1').toList();
    final selected = <String>[];
    for (final pid in targetPacks) {
      final pool = all.where((q) => q.packId == pid).toList()..shuffle(rng);
      selected.addAll(pool.take(10).map((q) => q.id));
    }
    if (selected.isEmpty) {
      final fallback = List<Question>.from(all)..shuffle(rng);
      return fallback.take(20).map((q) => q.id).toList();
    }
    return selected;
  }

  Future<List<String>> _fetchQuestionIdsForTrack(
    AppDatabase db,
    ExamTrack track, {
    int limit = 20,
  }) async {
    final rng = Random();
    final all = await db.select(db.questions).get();
    final filtered = all.where((q) {
      final body = q.examBody.toLowerCase();
      return switch (track) {
        ExamTrack.ncee => body == 'ncee',
        ExamTrack.bece => body == 'bece',
        ExamTrack.waecNeco => body == 'waec' || body == 'neco',
        ExamTrack.jambUtme => body == 'jamb' || body == 'waec',
      };
    }).toList();
    final chosen = (filtered.isNotEmpty ? filtered : List<Question>.from(all))
      ..shuffle(rng);
    return chosen.take(limit).map((q) => q.id).toList();
  }
}

class _CustomCbtBuilderSheet extends StatefulWidget {
  const _CustomCbtBuilderSheet({
    required this.packs,
    required this.db,
  });

  final List<SubjectPack> packs;
  final AppDatabase db;

  @override
  State<_CustomCbtBuilderSheet> createState() => _CustomCbtBuilderSheetState();
}

class _CustomCbtBuilderSheetState extends State<_CustomCbtBuilderSheet> {
  final Set<String> _selectedPackIds = {};
  ExamTrack _track = ExamTrack.waecNeco;
  int _questionCount = 20;
  String _difficulty = 'all';
  String _paperType = 'all';
  String _mode = 'study';
  int _minutes = 20;
  bool _shuffle = true;
  bool _launching = false;

  @override
  void initState() {
    super.initState();
    final filtered = _packsForTrack(_track);
    if (filtered.isNotEmpty) {
      _selectedPackIds.add(filtered.first.id);
    }
  }

  List<SubjectPack> _packsForTrack(ExamTrack track) {
    return widget.packs
        .where((p) => track.supportsSubject(p.subjectCode))
        .toList();
  }

  Future<void> _launch() async {
    if (_selectedPackIds.isEmpty || _launching) return;
    setState(() => _launching = true);

    final all = await widget.db.select(widget.db.questions).get();
    var filtered = all.where((q) => _selectedPackIds.contains(q.packId));

    if (_difficulty != 'all') {
      filtered = filtered.where((q) => q.difficulty.toLowerCase() == _difficulty);
    }
    if (_paperType != 'all') {
      filtered = filtered.where((q) => q.paperType.toLowerCase() == _paperType);
    }

    final list = filtered.toList();
    if (_shuffle) {
      list.shuffle(Random());
    }

    // Balance across selected subjects when multiple are chosen
    final picked = <String>[];
    if (_selectedPackIds.length > 1) {
      final perPack = max(1, _questionCount ~/ _selectedPackIds.length);
      for (final pid in _selectedPackIds) {
        final sub = list.where((q) => q.packId == pid).take(perPack);
        picked.addAll(sub.map((q) => q.id));
      }
      if (picked.length < _questionCount) {
        final remaining = list
            .where((q) => !picked.contains(q.id))
            .take(_questionCount - picked.length);
        picked.addAll(remaining.map((q) => q.id));
      }
    } else {
      picked.addAll(list.take(_questionCount).map((q) => q.id));
    }

    if (!mounted) return;
    setState(() => _launching = false);

    if (picked.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No questions match those filters. Try "All" difficulty or paper type.'),
        ),
      );
      return;
    }

    Navigator.pop(context);
    context.push('/exam', extra: {
      'track': _track.id,
      'mode': _mode,
      'durationMinutes': _minutes,
      'title': 'Custom CBT (${picked.length}Q)',
      'questionIds': picked,
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: context.naija.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: context.naija.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text('Custom CBT Test Builder',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(
                'Choose your subjects, question count, difficulty, and mode.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 14),
              Text('1. Exam Grading Track',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                children: [
                  for (final t in ExamTrack.values)
                    ChoiceChip(
                      label: Text(t.shortLabel),
                      selected: _track == t,
                      selectedColor: context.naija.emeraldSoft,
                      onSelected: (_) => setState(() {
                        _track = t;
                        final allowedIds =
                            _packsForTrack(t).map((p) => p.id).toSet();
                        _selectedPackIds.removeWhere((id) => !allowedIds.contains(id));
                        if (_selectedPackIds.isEmpty && allowedIds.isNotEmpty) {
                          _selectedPackIds.add(allowedIds.first);
                        }
                      }),
                    ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Text(
                    '2. Select Subjects (${_selectedPackIds.length} selected)',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => setState(() => _selectedPackIds.clear()),
                    child: const Text('Clear'),
                  ),
                ],
              ),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final p in _packsForTrack(_track))
                    FilterChip(
                      label: Text(p.subjectCode),
                      tooltip: p.title,
                      selected: _selectedPackIds.contains(p.id),
                      selectedColor: context.naija.emeraldSoft,
                      onSelected: (sel) {
                        setState(() {
                          if (sel) {
                            _selectedPackIds.add(p.id);
                          } else {
                            _selectedPackIds.remove(p.id);
                          }
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(height: 14),
              Text('3. Number of Questions',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                children: [
                  for (final count in [10, 20, 40, 60, 180])
                    ChoiceChip(
                      label: Text('$count Q'),
                      selected: _questionCount == count,
                      selectedColor: context.naija.emeraldSoft,
                      onSelected: (_) => setState(() {
                        _questionCount = count;
                        _minutes = count == 180 ? 120 : count;
                      }),
                    ),
                ],
              ),
              const SizedBox(height: 14),
              Text('4. Difficulty & Paper Type',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                children: [
                  for (final d in ['all', 'easy', 'medium', 'hard'])
                    ChoiceChip(
                      label: Text(d.toUpperCase()),
                      selected: _difficulty == d,
                      selectedColor: context.naija.emeraldSoft,
                      onSelected: (_) => setState(() => _difficulty = d),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                children: [
                  for (final pt in ['all', 'objective', 'theory', 'oral'])
                    ChoiceChip(
                      label: Text(pt.toUpperCase()),
                      selected: _paperType == pt,
                      selectedColor: context.naija.emeraldSoft,
                      onSelected: (_) => setState(() => _paperType = pt),
                    ),
                ],
              ),
              const SizedBox(height: 14),
              Text('5. Mode & Timer',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'study', label: Text('Study Mode')),
                  ButtonSegment(value: 'timed', label: Text('Timed CBT')),
                ],
                selected: {_mode},
                onSelectionChanged: (v) => setState(() => _mode = v.first),
              ),
              if (_mode == 'timed') ...[
                const SizedBox(height: 8),
                Text(
                  'Timer: $_minutes minutes',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.merge(AppTheme.monoTabular),
                ),
                Slider(
                  value: _minutes.toDouble().clamp(5, 180),
                  min: 5,
                  max: 180,
                  divisions: 35,
                  activeColor: context.naija.emerald,
                  onChanged: (v) => setState(() => _minutes = v.round()),
                ),
              ],
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Shuffle Questions'),
                subtitle: const Text('Draw a fresh randomized set each time'),
                value: _shuffle,
                onChanged: (v) => setState(() => _shuffle = v),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _selectedPackIds.isEmpty || _launching ? null : _launch,
                style: FilledButton.styleFrom(
                  backgroundColor: context.naija.emerald,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(
                  _launching
                      ? 'Building Test...'
                      : 'Start ${_mode == 'study' ? 'Study' : 'Timed'} CBT',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
