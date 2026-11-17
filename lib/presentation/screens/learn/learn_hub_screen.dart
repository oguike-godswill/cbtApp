import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/models/exam_track.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/db/app_database.dart';
import '../../providers/app_providers.dart';

class LearnHubScreen extends ConsumerStatefulWidget {
  const LearnHubScreen({super.key});

  @override
  ConsumerState<LearnHubScreen> createState() => _LearnHubScreenState();
}

class _LearnHubScreenState extends ConsumerState<LearnHubScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  List<FtsSearchResult> _searchResults = const [];
  bool _searching = false;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _onSearch(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        _searching = false;
        _searchResults = const [];
      });
      return;
    }
    final db = ref.read(databaseProvider);
    final res = await db.searchOfflineContent(query);
    if (mounted) {
      setState(() {
        _searching = true;
        _searchResults = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final packsAsync = ref.watch(subjectPacksProvider);
    final lessonsAsync = ref.watch(lessonsProvider);
    final progressAsync = ref.watch(lessonProgressMapProvider);
    final prefsAsync = ref.watch(preferencesProvider);
    final seedProgress = ref.watch(seedProgressProvider);
    final activeTrack = ExamTrack.fromId(
      prefsAsync.valueOrNull?.activeTrack ?? 'waec_neco',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Academy · ${activeTrack.shortLabel}'),
      ),
      body: Column(
        children: [
          if (seedProgress != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: context.naija.emeraldSoft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Indexing NERDC library: ${seedProgress.$1} / ${seedProgress.$2} subjects...',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: context.naija.emerald,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: seedProgress.$1 / seedProgress.$2,
                    minHeight: 4,
                    color: context.naija.emerald,
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: _searchCtrl,
              onChanged: _onSearch,
              decoration: InputDecoration(
                hintText: 'Search NERDC lessons & past questions offline...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchCtrl.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _searchCtrl.clear();
                          _onSearch('');
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
                filled: true,
                fillColor: context.naija.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: context.naija.border),
                ),
              ),
            ),
          ),
          Expanded(
            child: _searching
                ? _buildSearchResults(context)
                : packsAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('Error: $e')),
                    data: (allPacks) {
                      final packs = allPacks
                          .where((p) => activeTrack.supportsSubject(p.subjectCode))
                          .toList();
                      final lessons = lessonsAsync.valueOrNull ?? const <Lesson>[];
                      final progressMap =
                          progressAsync.valueOrNull ?? const <String, LessonProgressData>{};

                      return ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: packs.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (context, idx) {
                          final pack = packs[idx];
                          final packLessons = lessons
                              .where((l) => l.packId == pack.id)
                              .toList();

                          // Group lessons by moduleTitle for clean navigation
                          final modules = <String, List<Lesson>>{};
                          for (final l in packLessons) {
                            modules.putIfAbsent(l.moduleTitle, () => []).add(l);
                          }

                          return Card(
                            child: ExpansionTile(
                              initiallyExpanded: idx == 0,
                              shape: const Border(),
                              collapsedShape: const Border(),
                              title: Text(
                                pack.title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              subtitle: Text(
                                '${packLessons.length} interactive lessons · ${modules.length} modules · ${pack.nerdcLevel}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              children: [
                                for (final mod in modules.entries)
                                  ExpansionTile(
                                    tilePadding: const EdgeInsets.only(
                                        left: 24, right: 16),
                                    shape: const Border(),
                                    collapsedShape: const Border(),
                                    title: Text(
                                      mod.key,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                      '${mod.value.length} lessons',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    children: [
                                      for (final lesson in mod.value)
                                        ListTile(
                                          dense: true,
                                          contentPadding: const EdgeInsets.only(
                                              left: 36, right: 16),
                                          leading: Icon(
                                            (progressMap[lesson.id]
                                                        ?.isCompleted ??
                                                    false)
                                                ? Icons.check_circle
                                                : Icons.play_circle_outline,
                                            color: (progressMap[lesson.id]
                                                        ?.isCompleted ??
                                                    false)
                                                ? context.naija.emerald
                                                : context.naija.mutedInk,
                                            size: 18,
                                          ),
                                          title: Text(lesson.title),
                                          subtitle: Text(
                                            '${lesson.estimatedMinutes} min',
                                          ),
                                          trailing: const Icon(
                                              Icons.chevron_right,
                                              size: 18),
                                          onTap: () => context
                                              .push('/lesson/${lesson.id}'),
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    if (_searchResults.isEmpty) {
      return Center(
        child: Text(
          'No offline matches found for "${_searchCtrl.text}".',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _searchResults.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, idx) {
        final item = _searchResults[idx];
        final isLesson = item.kind == 'lesson';
        return Card(
          child: ListTile(
            leading: Icon(
              isLesson ? Icons.menu_book_outlined : Icons.quiz_outlined,
              color: context.naija.emerald,
            ),
            title: Text(item.title),
            subtitle: Text(
              item.snippet,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              if (isLesson) {
                context.push('/lesson/${item.itemId}');
              } else {
                context.push(
                  '/exam',
                  extra: {
                    'track': 'waec_neco',
                    'mode': 'study',
                    'title': 'Search Practice',
                    'questionIds': [item.itemId],
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
