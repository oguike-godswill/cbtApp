import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/models/exam_track.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/study_plan/daily_study_plan_builder.dart';
import '../../providers/app_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(preferencesProvider);
    final planAsync = ref.watch(dailyPlanProvider);
    final attemptsAsync = ref.watch(examAttemptsProvider);
    final activeSessionAsync = ref.watch(activeExamSessionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('NaijaPrep'),
        actions: [
          prefsAsync.when(
            data: (prefs) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                children: [
                  Icon(Icons.local_fire_department,
                      size: 18, color: context.naija.amber),
                  const SizedBox(width: 4),
                  Text(
                    '${prefs.streakDays}d streak',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.merge(AppTheme.monoTabular),
                  ),
                ],
              ),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: prefsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error loading preferences: $err')),
        data: (prefs) {
          final activeTrack = ExamTrack.fromId(prefs.activeTrack);
          final targetDate = prefs.targetExamDate;
          final daysLeft = targetDate?.difference(DateTime.now()).inDays;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _TrackHeaderCard(
                activeTrack: activeTrack,
                targetDate: targetDate,
                daysLeft: daysLeft,
                onSelectTrack: (t) =>
                    ref.read(preferencesProvider.notifier).setTrack(t),
                onPickDate: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate:
                        targetDate ?? DateTime.now().add(const Duration(days: 60)),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 730)),
                  );
                  if (picked != null) {
                    await ref
                        .read(preferencesProvider.notifier)
                        .setTargetExamDate(picked);
                  }
                },
              ),
              const SizedBox(height: 16),
              if (activeSessionAsync.valueOrNull != null) ...[
                _ResumeExamCard(
                  title: activeSessionAsync.valueOrNull!.title,
                  remainingSeconds: activeSessionAsync.valueOrNull!.remainingSeconds,
                  onResume: () {
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
                ),
                const SizedBox(height: 16),
              ],
              if (activeTrack == ExamTrack.jambUtme) ...[
                _JambComboCard(
                  combo: ref.watch(jambComboProvider),
                  onEdit: () => _showJambComboDialog(context, ref),
                ),
                const SizedBox(height: 16),
              ],
              if (!prefs.diagnosticCompleted) ...[
                _DiagnosticBanner(
                  onStart: () => _showDiagnosticDialog(context, ref, activeTrack),
                ),
                const SizedBox(height: 16),
              ] else if (prefs.diagnosticSummary.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.naija.emeraldSoft,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: context.naija.emerald),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline,
                          color: context.naija.emerald, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Diagnostic: ${prefs.diagnosticSummary}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: context.naija.ink,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Text(
                "Today's 3-Step Daily Plan",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                'Focused 15–20 min offline queue · ${activeTrack.shortLabel} · ${activeTrack.level}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              planAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Text('Could not build plan: $e'),
                data: (plan) => Column(
                  children: [
                    _DailyStepTile(
                      stepNumber: '01',
                      title: plan.nextLesson?.title ?? 'Explore Subject Academy',
                      subtitle: plan.nextLesson != null
                          ? '${plan.nextLesson!.moduleTitle} · ${plan.nextLesson!.estimatedMinutes} min interactive lesson'
                          : 'All starter lessons completed',
                      icon: Icons.menu_book_outlined,
                      accentColor: context.naija.emerald,
                      actionLabel: 'Learn',
                      onTap: () {
                        if (plan.nextLesson != null) {
                          context.push('/lesson/${plan.nextLesson!.id}');
                        } else {
                          context.go('/learn');
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    _DailyStepTile(
                      stepNumber: '02',
                      title: 'Mistake Vault SM-2 Review',
                      subtitle: plan.dueMistakeCount == 0
                          ? 'Zero overdue mistakes — vault is clear'
                          : '${plan.dueMistakeCount} missed question(s) scheduled for review today',
                      icon: Icons.replay_circle_filled_outlined,
                      accentColor: plan.dueMistakeCount > 0
                          ? context.naija.amber
                          : context.naija.emerald,
                      actionLabel: 'Review',
                      onTap: () => context.go('/vault'),
                    ),
                    const SizedBox(height: 10),
                    _DailyStepTile(
                      stepNumber: '03',
                      title: '${activeTrack.shortLabel} Timed Drill',
                      subtitle:
                          '${plan.practiceQuestionIds.length} exam questions with worked steps & scratchpad',
                      icon: Icons.timer_outlined,
                      accentColor: context.naija.emerald,
                      actionLabel: 'Start',
                      onTap: () => context.push(
                        '/exam',
                        extra: {
                          'track': activeTrack.id,
                          'mode': 'study',
                          'title': '${activeTrack.shortLabel} Daily Drill',
                          'questionIds': plan.practiceQuestionIds,
                        },
                      ),
                    ),
                    const SizedBox(height: 18),
                    _ReadinessCard(
                      readinessPercent: plan.readinessPercent,
                      completedLessons: plan.completedLessonsCount,
                      totalLessons: plan.totalLessonsCount,
                      recentAttempts: attemptsAsync.valueOrNull ?? const [],
                      subjectBreakdown: plan.subjectBreakdown,
                      weakestSubject: plan.weakestSubject,
                      onDrillWeakest: plan.weakestSubject == null
                          ? null
                          : () => context.push(
                                '/exam',
                                extra: {
                                  'track': activeTrack.id,
                                  'mode': 'study',
                                  'title':
                                      'Drill ${plan.weakestSubject!.subjectCode}',
                                  'questionIds':
                                      plan.weakestSubject!.questionIds,
                                },
                              ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showJambComboDialog(BuildContext context, WidgetRef ref) async {
    final current = ref.read(jambComboProvider);
    final selected = Set<String>.from(current)..add('ENG');
    final electives = ExamTrack.jambUtme.allowedSubjectCodes
        .where((c) => c != 'ENG')
        .toList()
      ..sort();

    await showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          title: const Text('JAMB 4-Subject Combination'),
          content: SizedBox(
            width: 340,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Use of English (ENG) is compulsory. Pick 3 electives:'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final code in electives)
                        FilterChip(
                          label: Text(code),
                          selected: selected.contains(code),
                          onSelected: (on) {
                            setLocal(() {
                              if (on) {
                                if (selected.length < 4) selected.add(code);
                              } else {
                                selected.remove(code);
                              }
                            });
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: selected.length == 4
                  ? () {
                      ref.read(jambComboProvider.notifier).state =
                          selected.toList();
                      Navigator.pop(ctx);
                    }
                  : null,
              child: Text('Save (${selected.length}/4)'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDiagnosticDialog(
    BuildContext context,
    WidgetRef ref,
    ExamTrack track,
  ) async {
    final items = switch (track) {
      ExamTrack.ncee => const [
          ('What is 25% of 80?', ['15', '20', '25', '30'], 1),
          ('Share 30 in ratio 2:3. Larger share?', ['12', '15', '18', '20'], 2),
          ('Opposite of "generous"?', ['kind', 'stingy', 'brave', 'quiet'], 1),
        ],
      ExamTrack.bece => const [
          ('Simplify 3x + 2x - x:', ['3x', '4x', '5x', '6x'], 1),
          ('Which organ pumps blood?', ['Lungs', 'Kidney', 'Heart', 'Liver'], 2),
          ('Capital of Nigeria?', ['Lagos', 'Kano', 'Abuja', 'Enugu'], 2),
        ],
      _ => const [
          ('If 2x + 5 = 13, find x:', ['3', '4', '6', '9'], 1),
          ('Sum of roots of x² - 7x + 10 = 0:', ['-7', '7', '10', '-10'], 1),
          ('The principal, as well as the teachers, ___ here.', ['are', 'were', 'is', 'have'], 2),
        ],
    };

    var qIdx = 0;
    var score = 0;
    var selectedAnswer = -1;

    await showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) {
          final item = items[qIdx];
          return AlertDialog(
            title: Text('${track.shortLabel} Diagnostic (${qIdx + 1}/${items.length})'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.$1),
                const SizedBox(height: 10),
                for (final entry in item.$2.asMap().entries)
                  RadioListTile<int>(
                    value: entry.key,
                    groupValue: selectedAnswer,
                    title: Text(entry.value),
                    dense: true,
                    onChanged: (v) => setLocal(() => selectedAnswer = v ?? -1),
                  ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Later'),
              ),
              FilledButton(
                onPressed: selectedAnswer == -1
                    ? null
                    : () async {
                        if (selectedAnswer == item.$3) score++;
                        if (qIdx < items.length - 1) {
                          setLocal(() {
                            qIdx++;
                            selectedAnswer = -1;
                          });
                        } else {
                          final msg = score >= 2
                              ? 'Strong ${track.shortLabel} Baseline ($score/${items.length})'
                              : 'Focus on Core Foundations first ($score/${items.length})';
                          await ref
                              .read(preferencesProvider.notifier)
                              .completeDiagnostic(msg);
                          if (ctx.mounted) Navigator.pop(ctx);
                        }
                      },
                child: Text(qIdx < items.length - 1 ? 'Next' : 'Finish'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TrackHeaderCard extends StatelessWidget {
  const _TrackHeaderCard({
    required this.activeTrack,
    required this.targetDate,
    required this.daysLeft,
    required this.onSelectTrack,
    required this.onPickDate,
  });

  final ExamTrack activeTrack;
  final DateTime? targetDate;
  final int? daysLeft;
  final ValueChanged<ExamTrack> onSelectTrack;
  final VoidCallback onPickDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Active Exam Track',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                InkWell(
                  onTap: onPickDate,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,
                            size: 14, color: context.naija.emerald),
                        const SizedBox(width: 6),
                        Text(
                          targetDate == null
                              ? 'Set exam date'
                              : daysLeft != null && daysLeft! >= 0
                                  ? '$daysLeft days to ${DateFormat.MMMd().format(targetDate!)}'
                                  : DateFormat.yMMMd().format(targetDate!),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: context.naija.emerald,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final track in ExamTrack.values) ...[
                    ChoiceChip(
                      label: Text(track.shortLabel),
                      selected: track == activeTrack,
                      selectedColor: context.naija.emeraldSoft,
                      onSelected: (_) => onSelectTrack(track),
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              activeTrack.description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _DiagnosticBanner extends StatelessWidget {
  const _DiagnosticBanner({required this.onStart});
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(Icons.psychology_outlined,
                color: context.naija.emerald, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quick Placement Check',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 2),
                  Text(
                    'Calibrate your daily study queue in 60 seconds.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: onStart,
              style: FilledButton.styleFrom(
                backgroundColor: context.naija.emerald,
              ),
              child: const Text('Check'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DailyStepTile extends StatelessWidget {
  const _DailyStepTile({
    required this.stepNumber,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.actionLabel,
    required this.onTap,
  });

  final String stepNumber;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.naija.canvas,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.naija.border),
                ),
                child: Text(
                  stepNumber,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.merge(AppTheme.monoTabular)
                      .copyWith(color: accentColor),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 2),
                    Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: onTap,
                style: OutlinedButton.styleFrom(
                  foregroundColor: accentColor,
                  side: BorderSide(color: context.naija.border),
                  minimumSize: const Size(48, 42),
                ),
                child: Text(actionLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _JambComboCard extends StatelessWidget {
  const _JambComboCard({
    required this.combo,
    required this.onEdit,
  });

  final List<String> combo;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.layers_outlined, color: context.naija.emerald),
        title: const Text('JAMB 4-Subject Combination'),
        subtitle: Text(
          combo.join(' · '),
          style: Theme.of(context).textTheme.bodySmall?.merge(AppTheme.monoTabular),
        ),
        trailing: TextButton(onPressed: onEdit, child: const Text('Change')),
      ),
    );
  }
}

class _ResumeExamCard extends StatelessWidget {
  const _ResumeExamCard({
    required this.title,
    required this.remainingSeconds,
    required this.onResume,
  });

  final String title;
  final int remainingSeconds;
  final VoidCallback onResume;

  @override
  Widget build(BuildContext context) {
    final mins = remainingSeconds ~/ 60;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(Icons.play_circle_fill, color: context.naija.amber, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Unfinished CBT Saved',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    '$title · $mins min remaining',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            FilledButton(
              onPressed: onResume,
              style: FilledButton.styleFrom(backgroundColor: context.naija.amber),
              child: const Text('Resume'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadinessCard extends StatelessWidget {
  const _ReadinessCard({
    required this.readinessPercent,
    required this.completedLessons,
    required this.totalLessons,
    required this.recentAttempts,
    required this.subjectBreakdown,
    required this.weakestSubject,
    this.onDrillWeakest,
  });

  final int readinessPercent;
  final int completedLessons;
  final int totalLessons;
  final List<dynamic> recentAttempts;
  final List<SubjectReadiness> subjectBreakdown;
  final SubjectReadiness? weakestSubject;
  final VoidCallback? onDrillWeakest;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Exam Readiness',
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                Text(
                  '$readinessPercent%',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.merge(AppTheme.monoTabular)
                      .copyWith(color: context.naija.emerald),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: readinessPercent / 100.0,
                minHeight: 8,
                backgroundColor: context.naija.canvas,
                color: context.naija.emerald,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Lessons mastered: $completedLessons / $totalLessons  ·  Mock attempts: ${recentAttempts.length}',
              style: Theme.of(context).textTheme.bodySmall?.merge(AppTheme.monoTabular),
            ),
            if (subjectBreakdown.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 10),
              Text('Subject Heatmap',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      )),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final s in subjectBreakdown)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: s.readinessPercent >= 60
                            ? context.naija.emeraldSoft
                            : context.naija.canvas,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: context.naija.border),
                      ),
                      child: Text(
                        '${s.subjectCode} · ${s.readinessPercent}%',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.merge(AppTheme.monoTabular),
                      ),
                    ),
                ],
              ),
              if (weakestSubject != null && onDrillWeakest != null) ...[
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: onDrillWeakest,
                    icon: const Icon(Icons.bolt, size: 18),
                    label: Text(
                      'Drill Weakest: ${weakestSubject!.subjectCode} (${weakestSubject!.readinessPercent}%)',
                    ),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
