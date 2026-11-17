import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/models/exam_track.dart';
import 'core/theme/app_theme.dart';
import 'data/seed/starter_pack_seeder.dart';
import 'presentation/providers/app_providers.dart';
import 'presentation/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final db = container.read(databaseProvider);
  await StarterPackSeeder.seedIfNeeded(db);

  // Load remaining NERDC subject packs (up to 33 subjects / 20,000 questions) in the background
  Future.microtask(() async {
    await StarterPackSeeder.seedRemainingCatalogPacks(
      db,
      onProgress: (loaded, total) {
        container.read(seedProgressProvider.notifier).state =
            loaded >= total ? null : (loaded, total);
      },
    );
    container.read(seedProgressProvider.notifier).state = null;
    container.invalidate(subjectPacksProvider);
    container.invalidate(lessonsProvider);
    container.invalidate(dailyPlanProvider);
  });

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const NaijaPrepApp(),
    ),
  );
}

class NaijaPrepApp extends ConsumerWidget {
  const NaijaPrepApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final prefsAsync = ref.watch(preferencesProvider);

    final themeMode = StudyThemeMode.fromId(
      prefsAsync.valueOrNull?.themeMode ?? 'light',
    );
    final fontScale = FontScaleOption.fromId(
      prefsAsync.valueOrNull?.fontScale ?? 'normal',
    );

    return MaterialApp.router(
      title: 'NaijaPrep',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.build(themeMode),
      routerConfig: router,
      builder: (context, child) {
        final media = MediaQuery.of(context);
        return MediaQuery(
          data: media.copyWith(
            textScaler: TextScaler.linear(fontScale.factor),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
