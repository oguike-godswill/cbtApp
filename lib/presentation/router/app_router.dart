import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/exam_track.dart';
import '../providers/app_providers.dart';
import '../screens/home/home_screen.dart';
import '../screens/learn/learn_hub_screen.dart';
import '../screens/learn/lesson_player_screen.dart';
import '../screens/practice/exam_simulator_screen.dart';
import '../screens/practice/practice_hub_screen.dart';
import '../screens/vault/vault_packs_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return _AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (_, _) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/learn',
                builder: (_, _) => const LearnHubScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/practice',
                builder: (_, _) => const PracticeHubScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/vault',
                builder: (_, _) => const VaultPacksScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/lesson/:lessonId',
        builder: (context, state) => LessonPlayerScreen(
          lessonId: state.pathParameters['lessonId'] ?? '',
        ),
      ),
      GoRoute(
        path: '/exam',
        builder: (context, state) {
          final extra = (state.extra as Map<String, dynamic>?) ?? const {};
          return ExamSimulatorScreen(
            sessionId: extra['sessionId'] as String?,
            durationMinutes: extra['durationMinutes'] as int?,
            track: ExamTrack.fromId(
              (extra['track'] as String?) ?? 'waec_neco',
            ),
            mode: (extra['mode'] as String?) ?? 'study',
            title: (extra['title'] as String?) ?? 'Exam Simulator',
            questionIds: (extra['questionIds'] as List?)
                    ?.map((e) => e.toString())
                    .toList() ??
                const [],
          );
        },
      ),
    ],
  );
});

class _AppShell extends ConsumerWidget {
  const _AppShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examLocked = ref.watch(examLockProvider);
    final isWide = MediaQuery.sizeOf(context).width >= 840;

    if (isWide) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: (index) {
                if (examLocked) return;
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.menu_book_outlined),
                  selectedIcon: Icon(Icons.menu_book),
                  label: Text('Learn'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.quiz_outlined),
                  selectedIcon: Icon(Icons.quiz),
                  label: Text('Practice'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.inventory_2_outlined),
                  selectedIcon: Icon(Icons.inventory_2),
                  label: Text('Packs'),
                ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: navigationShell),
          ],
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          if (examLocked) return;
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Learn',
          ),
          NavigationDestination(
            icon: Icon(Icons.quiz_outlined),
            selectedIcon: Icon(Icons.quiz),
            label: 'Practice',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Packs',
          ),
        ],
      ),
    );
  }
}
