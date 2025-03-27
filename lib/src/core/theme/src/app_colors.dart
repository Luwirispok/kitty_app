import 'package:flutter/material.dart';

/// Application colors
///
/// Rules: https://m3.material.io/styles/color/system/overview

final class AppColors extends ThemeExtension<AppColors> {
  final Color red;
  final Color orange;
  final Color green;
  final Color blue;
  final Color white;
  final Color black;

  final Color error;
  final Color warning;
  final Color positive;

  final Color accent;

  final Color surface;

  final Color background;

  final Color primary;
  final Color secondary;
  final Color tertiary;

  final Color textPrimary;
  final Color textSecondary;
  final Color textAccent;

  final Color textOnAccent;

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) return this;
    return AppColors(
      red: Color.lerp(red, other.red, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      green: Color.lerp(green, other.green, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      error: Color.lerp(error, other.error, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      positive: Color.lerp(positive, other.positive, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      background: Color.lerp(background, other.background, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textAccent: Color.lerp(textAccent, other.textAccent, t)!,
      textOnAccent: Color.lerp(textOnAccent, other.textOnAccent, t)!,
    );
  }

  const AppColors({
    required this.red,
    required this.orange,
    required this.green,
    required this.blue,
    required this.white,
    required this.black,
    required this.error,
    required this.warning,
    required this.positive,
    required this.accent,
    required this.surface,
    required this.background,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textAccent,
    required this.textOnAccent,
  });

  @override
  AppColors copyWith({
    Color? red,
    Color? orange,
    Color? green,
    Color? blue,
    Color? white,
    Color? black,
    Color? error,
    Color? warning,
    Color? positive,
    Color? accent,
    Color? surface,
    Color? background,
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? textPrimary,
    Color? textSecondary,
    Color? textAccent,
    Color? textOnAccent,
  }) {
    return AppColors(
      red: red ?? this.red,
      orange: orange ?? this.orange,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      white: white ?? this.white,
      black: black ?? this.black,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      positive: positive ?? this.positive,
      accent: accent ?? this.accent,
      surface: surface ?? this.surface,
      background: background ?? this.background,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textAccent: textAccent ?? this.textAccent,
      textOnAccent: textOnAccent ?? this.textOnAccent,
    );
  }
}

extension ColorSchemeBuilder on AppColors {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: accent,
      error: error,
      errorContainer: error,
    );
  }
}
