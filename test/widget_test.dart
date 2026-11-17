import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naijaprep/core/models/exam_track.dart';
import 'package:naijaprep/core/theme/app_theme.dart';
import 'package:naijaprep/presentation/widgets/interactive_visualizer.dart';
import 'package:naijaprep/presentation/widgets/rough_work_scratchpad.dart';

void main() {
  testWidgets('RoughWorkScratchpad renders and responds to close button', (tester) async {
    var closed = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.build(StudyThemeMode.light),
        home: Scaffold(
          body: SizedBox(
            height: 300,
            child: RoughWorkScratchpad(
              scopeKey: 'q1',
              onClose: () => closed = true,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Rough-Work Scratchpad'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.close));
    expect(closed, isTrue);
  });

  testWidgets('InteractiveVisualizer renders quadratic_parabola with sliders', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.build(StudyThemeMode.dark),
        home: const Scaffold(
          body: SingleChildScrollView(
            child: InteractiveVisualizer(
              simConfig: {
                'type': 'quadratic_parabola',
                'title': 'Parabola Test',
                'a': 1.0,
                'b': -3.0,
                'c': 2.0,
              },
            ),
          ),
        ),
      ),
    );

    expect(find.text('Parabola Test'), findsOneWidget);
    expect(find.byType(Slider), findsNWidgets(3));
  });
}
