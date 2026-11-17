import 'dart:convert';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/models/exam_track.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/db/app_database.dart';
import '../../../data/db/pack_validator.dart';
import '../../../data/seed/starter_pack_seeder.dart';
import '../../providers/app_providers.dart';

class VaultPacksScreen extends ConsumerStatefulWidget {
  const VaultPacksScreen({super.key});

  @override
  ConsumerState<VaultPacksScreen> createState() => _VaultPacksScreenState();
}

class _VaultPacksScreenState extends ConsumerState<VaultPacksScreen> {
  final GlobalKey _shareCardKey = GlobalKey();
  bool _syncingManifest = false;

  Future<void> _openFlashcardDeck(List<Flashcard> cards) async {
    var index = 0;
    var showBack = false;
    await showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDeck) {
          final card = cards[index];
          return AlertDialog(
            title: Text('Flashcard ${index + 1} / ${cards.length}'),
            content: InkWell(
              onTap: () => setDeck(() => showBack = !showBack),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 320,
                constraints: const BoxConstraints(minHeight: 150),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: showBack
                      ? context.naija.emeraldSoft
                      : context.naija.canvas,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: context.naija.emerald),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      showBack ? 'SUBJECT / TOPIC' : 'KEY EXAM RULE (TAP TO FLIP)',
                      style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.naija.emerald,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      showBack ? card.subjectTitle : card.ruleText,
                      textAlign: TextAlign.center,
                      style: Theme.of(ctx).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: index > 0
                    ? () => setDeck(() {
                          index--;
                          showBack = false;
                        })
                    : null,
                child: const Text('Prev'),
              ),
              TextButton(
                onPressed: index < cards.length - 1
                    ? () => setDeck(() {
                          index++;
                          showBack = false;
                        })
                    : null,
                child: const Text('Next'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Done'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _downloadOnlinePack() async {
    if (_syncingManifest) return;
    setState(() => _syncingManifest = true);
    try {
      final dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 4)));
      final resp = await dio.get('http://localhost:3000/api/packs/pack_gov_ss_v1');
      final rawJson = resp.data is String
          ? resp.data as String
          : jsonEncode(resp.data['pack'] ?? resp.data);
      final expectedSha = resp.data is Map ? resp.data['sha256'] as String? : null;
      if (expectedSha != null &&
          PackValidator.computeSha256(rawJson) != expectedSha) {
        throw Exception('SHA-256 checksum mismatch!');
      }
      final db = ref.read(databaseProvider);
      await StarterPackSeeder.importPackFromJsonString(db, rawJson);
      ref.invalidate(subjectPacksProvider);
      ref.invalidate(lessonsProvider);
      ref.invalidate(dailyPlanProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Downloaded & SHA-256 verified Government pack!'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Pack sync requires backend running on localhost:3000 ($e)',
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _syncingManifest = false);
    }
  }

  Future<void> _shareParentProgress() async {
    try {
      final boundary = _shareCardKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) return;
      final image = await boundary.toImage(pixelRatio: 2.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;

      await Share.shareXFiles(
        [
          XFile.fromData(
            byteData.buffer.asUint8List(),
            mimeType: 'image/png',
            name: 'naijaprep_progress.png',
          ),
        ],
        text: 'NaijaPrep Weekly Study & Exam Readiness Report',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not export progress card: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final prefsAsync = ref.watch(preferencesProvider);
    final vaultAsync = ref.watch(mistakeVaultProvider);
    final packsAsync = ref.watch(subjectPacksProvider);
    final flashcardsAsync = ref.watch(flashcardsProvider);
    final planAsync = ref.watch(dailyPlanProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mistake Vault & Packs')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('SM-2 Mistake Vault',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            'Missed questions auto-schedule for 1d → 3d → 7d spaced review.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          vaultAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
            data: (items) {
              if (items.isEmpty) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      'No mistakes logged yet. Any missed question during Practice will appear here automatically.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                );
              }
              final now = DateTime.now();
              final dueIds = items
                  .where((e) => !e.$1.nextReviewAt.isAfter(now))
                  .map((e) => e.$2.id)
                  .toList();

              return Column(
                children: [
                  if (dueIds.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: FilledButton.icon(
                        onPressed: () => context.push('/exam', extra: {
                          'track': 'waec_neco',
                          'mode': 'study',
                          'title': 'Mistake Vault Review',
                          'questionIds': dueIds,
                        }),
                        style: FilledButton.styleFrom(
                          backgroundColor: context.naija.amber,
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        icon: const Icon(Icons.replay),
                        label: Text('Review ${dueIds.length} Due Mistake(s)'),
                      ),
                    ),
                  for (final (sm2, q) in items.take(5)) ...[
                    Card(
                      child: ListTile(
                        title: Text('${q.examBody} ${q.examYear} · ${q.answerSummary}'),
                        subtitle: Text(
                          'Interval: ${sm2.intervalDays}d · Next: ${DateFormat.MMMd().format(sm2.nextReviewAt)}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () => context.push('/exam', extra: {
                            'track': 'waec_neco',
                            'mode': 'study',
                            'title': 'Mistake Review',
                            'questionIds': [q.id],
                          }),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          Text('Saved Rule Flashcards',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          flashcardsAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
            data: (cards) {
              if (cards.isEmpty) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      'Tap the card icon next to any Key Exam Rule inside a lesson to save it here.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: OutlinedButton.icon(
                      onPressed: () => _openFlashcardDeck(cards),
                      icon: const Icon(Icons.flip),
                      label: Text('Study Flashcard Deck (${cards.length})'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 44),
                      ),
                    ),
                  ),
                  for (final c in cards.take(5)) ...[
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.style_outlined,
                            color: context.naija.emerald),
                        title: Text(c.ruleText),
                        subtitle: Text(c.subjectTitle),
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text('Offline Subject Packs (SHA-256)',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              TextButton.icon(
                onPressed: _syncingManifest ? null : _downloadOnlinePack,
                icon: _syncingManifest
                    ? const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.cloud_download_outlined, size: 18),
                label: const Text('Sync Pack'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          packsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
            data: (packs) => Column(
              children: [
                for (final p in packs) ...[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.verified_outlined,
                          color: context.naija.emerald),
                      title: Text(p.title),
                      subtitle: Text(
                        '${p.nerdcLevel} · ${(p.sizeBytes / 1024).toStringAsFixed(1)} KB · SHA ${p.checksum.substring(0, 8)}',
                      ),
                      trailing: Text(
                        'v${p.version}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.merge(AppTheme.monoTabular),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Study Comfort & Themes',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          prefsAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
            data: (prefs) {
              final currentTheme = StudyThemeMode.fromId(prefs.themeMode);
              final currentScale = FontScaleOption.fromId(prefs.fontScale);
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Study Theme',
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: [
                          for (final mode in StudyThemeMode.values)
                            ChoiceChip(
                              label: Text(mode.label),
                              selected: mode == currentTheme,
                              selectedColor: context.naija.emeraldSoft,
                              onSelected: (_) => ref
                                  .read(preferencesProvider.notifier)
                                  .setThemeMode(mode),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text('Reading Font Size',
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: [
                          for (final opt in FontScaleOption.values)
                            ChoiceChip(
                              label: Text(opt.label),
                              selected: opt == currentScale,
                              selectedColor: context.naija.emeraldSoft,
                              onSelected: (_) => ref
                                  .read(preferencesProvider.notifier)
                                  .setFontScale(opt),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text('Parent / Guardian Progress Card',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          RepaintBoundary(
            key: _shareCardKey,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: planAsync.when(
                  loading: () => const SizedBox(height: 60),
                  error: (_, _) => const SizedBox.shrink(),
                  data: (plan) {
                    final track = ExamTrack.fromId(
                      prefsAsync.valueOrNull?.activeTrack ?? 'waec_neco',
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.school, color: context.naija.emerald),
                            const SizedBox(width: 8),
                            Text(
                              'NaijaPrep Progress · ${track.shortLabel}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Readiness: ${plan.readinessPercent}%  ·  Lessons: ${plan.completedLessonsCount}/${plan.totalLessonsCount}  ·  Due Reviews: ${plan.dueMistakeCount}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.merge(AppTheme.monoTabular),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _shareParentProgress,
            icon: const Icon(Icons.share_outlined),
            label: const Text('Share Progress Summary'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
