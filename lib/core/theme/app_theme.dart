import 'package:flutter/material.dart';
import '../models/exam_track.dart';

class NaijaColors extends ThemeExtension<NaijaColors> {
  const NaijaColors({
    required this.canvas,
    required this.surface,
    required this.ink,
    required this.mutedInk,
    required this.border,
    required this.emerald,
    required this.emeraldSoft,
    required this.amber,
    required this.amberSoft,
    required this.coral,
    required this.coralSoft,
  });

  final Color canvas;
  final Color surface;
  final Color ink;
  final Color mutedInk;
  final Color border;
  final Color emerald;
  final Color emeraldSoft;
  final Color amber;
  final Color amberSoft;
  final Color coral;
  final Color coralSoft;

  static const daylight = NaijaColors(
    canvas: Color(0xFFF8FAFC),
    surface: Color(0xFFFFFFFF),
    ink: Color(0xFF0F172A),
    mutedInk: Color(0xFF475569),
    border: Color(0xFFE2E8F0),
    emerald: Color(0xFF046A38),
    emeraldSoft: Color(0xFFE6F4EC),
    amber: Color(0xFFD97706),
    amberSoft: Color(0xFFFEF3C7),
    coral: Color(0xFFDC2626),
    coralSoft: Color(0xFFFEE2E2),
  );

  static const night = NaijaColors(
    canvas: Color(0xFF0F172A),
    surface: Color(0xFF1E293B),
    ink: Color(0xFFF1F5F9),
    mutedInk: Color(0xFF94A3B8),
    border: Color(0xFF334155),
    emerald: Color(0xFF10B981),
    emeraldSoft: Color(0xFF064E3B),
    amber: Color(0xFFF59E0B),
    amberSoft: Color(0xFF451A03),
    coral: Color(0xFFF87171),
    coralSoft: Color(0xFF450A0A),
  );

  static const sepia = NaijaColors(
    canvas: Color(0xFFF6F1E7),
    surface: Color(0xFFFDFBF7),
    ink: Color(0xFF292524),
    mutedInk: Color(0xFF57534E),
    border: Color(0xFFE5DEC9),
    emerald: Color(0xFF046A38),
    emeraldSoft: Color(0xFFE3EFE7),
    amber: Color(0xFFB45309),
    amberSoft: Color(0xFFFEF3C7),
    coral: Color(0xFFB91C1C),
    coralSoft: Color(0xFFFEE2E2),
  );

  @override
  NaijaColors copyWith({
    Color? canvas,
    Color? surface,
    Color? ink,
    Color? mutedInk,
    Color? border,
    Color? emerald,
    Color? emeraldSoft,
    Color? amber,
    Color? amberSoft,
    Color? coral,
    Color? coralSoft,
  }) {
    return NaijaColors(
      canvas: canvas ?? this.canvas,
      surface: surface ?? this.surface,
      ink: ink ?? this.ink,
      mutedInk: mutedInk ?? this.mutedInk,
      border: border ?? this.border,
      emerald: emerald ?? this.emerald,
      emeraldSoft: emeraldSoft ?? this.emeraldSoft,
      amber: amber ?? this.amber,
      amberSoft: amberSoft ?? this.amberSoft,
      coral: coral ?? this.coral,
      coralSoft: coralSoft ?? this.coralSoft,
    );
  }

  @override
  NaijaColors lerp(ThemeExtension<NaijaColors>? other, double t) {
    if (other is! NaijaColors) return this;
    return NaijaColors(
      canvas: Color.lerp(canvas, other.canvas, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      mutedInk: Color.lerp(mutedInk, other.mutedInk, t)!,
      border: Color.lerp(border, other.border, t)!,
      emerald: Color.lerp(emerald, other.emerald, t)!,
      emeraldSoft: Color.lerp(emeraldSoft, other.emeraldSoft, t)!,
      amber: Color.lerp(amber, other.amber, t)!,
      amberSoft: Color.lerp(amberSoft, other.amberSoft, t)!,
      coral: Color.lerp(coral, other.coral, t)!,
      coralSoft: Color.lerp(coralSoft, other.coralSoft, t)!,
    );
  }
}

extension NaijaThemeContext on BuildContext {
  NaijaColors get naija =>
      Theme.of(this).extension<NaijaColors>() ?? NaijaColors.daylight;
}

class AppTheme {
  static ThemeData build(StudyThemeMode mode) {
    final tokens = switch (mode) {
      StudyThemeMode.light => NaijaColors.daylight,
      StudyThemeMode.dark => NaijaColors.night,
      StudyThemeMode.sepia => NaijaColors.sepia,
    };

    final brightness =
        mode == StudyThemeMode.dark ? Brightness.dark : Brightness.light;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: tokens.emerald,
      onPrimary: Colors.white,
      secondary: tokens.emerald,
      onSecondary: Colors.white,
      error: tokens.coral,
      onError: Colors.white,
      surface: tokens.surface,
      onSurface: tokens.ink,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: tokens.canvas,
      extensions: [tokens],
      appBarTheme: AppBarTheme(
        backgroundColor: tokens.surface,
        foregroundColor: tokens.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: Border(bottom: BorderSide(color: tokens.border)),
      ),
      cardTheme: CardThemeData(
        color: tokens.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: tokens.border),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: tokens.surface,
        indicatorColor: tokens.emeraldSoft,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: selected ? tokens.emerald : tokens.mutedInk,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? tokens.emerald : tokens.mutedInk,
          );
        }),
      ),
      dividerTheme: DividerThemeData(color: tokens.border, thickness: 1),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: tokens.ink,
          letterSpacing: -0.3,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: tokens.ink,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: tokens.ink,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          height: 1.5,
          color: tokens.ink,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.45,
          color: tokens.ink,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.4,
          color: tokens.mutedInk,
        ),
      ),
    );
  }

  static const TextStyle monoTabular = TextStyle(
    fontFeatures: [FontFeature.tabularFigures()],
    fontWeight: FontWeight.w600,
  );
}
