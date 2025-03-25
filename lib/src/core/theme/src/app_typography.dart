import 'package:flutter/material.dart'
    show TextStyle, ThemeExtension, TextTheme, immutable, Color;

/// Application text styles
///
/// Rules: https://m3.material.io/styles/typography/overview

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;

  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;

  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;

  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  final TextStyle buttonLarge;
  final TextStyle buttonMedium;
  final TextStyle buttonSmall;

  final TextStyle inputLarge;
  final TextStyle inputMedium;
  final TextStyle inputSmall;

  const AppTypography({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.buttonLarge,
    required this.buttonMedium,
    required this.buttonSmall,
    required this.inputLarge,
    required this.inputMedium,
    required this.inputSmall,
  });

  factory AppTypography.withColor(
    Color color, {
    required TextStyle displayLarge,
    required TextStyle displayMedium,
    required TextStyle displaySmall,
    required TextStyle headlineLarge,
    required TextStyle headlineMedium,
    required TextStyle headlineSmall,
    required TextStyle titleLarge,
    required TextStyle titleMedium,
    required TextStyle titleSmall,
    required TextStyle bodyLarge,
    required TextStyle bodyMedium,
    required TextStyle bodySmall,
    required TextStyle labelLarge,
    required TextStyle labelMedium,
    required TextStyle labelSmall,
    required TextStyle buttonLarge,
    required TextStyle buttonMedium,
    required TextStyle buttonSmall,
    required TextStyle inputLarge,
    required TextStyle inputMedium,
    required TextStyle inputSmall,
  }) {
    return AppTypography(
      displayLarge: displayLarge.copyWith(color: color),
      displayMedium: displayMedium.copyWith(color: color),
      displaySmall: displaySmall.copyWith(color: color),
      headlineLarge: headlineLarge.copyWith(color: color),
      headlineMedium: headlineMedium.copyWith(color: color),
      headlineSmall: headlineSmall.copyWith(color: color),
      titleLarge: titleLarge.copyWith(color: color),
      titleMedium: titleMedium.copyWith(color: color),
      titleSmall: titleSmall.copyWith(color: color),
      bodyLarge: bodyLarge.copyWith(color: color),
      bodyMedium: bodyMedium.copyWith(color: color),
      bodySmall: bodySmall.copyWith(color: color),
      labelLarge: labelLarge.copyWith(color: color),
      labelMedium: labelMedium.copyWith(color: color),
      labelSmall: labelSmall.copyWith(color: color),
      buttonLarge: buttonLarge.copyWith(color: color),
      buttonMedium: buttonMedium.copyWith(color: color),
      buttonSmall: buttonSmall.copyWith(color: color),
      inputLarge: inputLarge.copyWith(color: color),
      inputMedium: inputMedium.copyWith(color: color),
      inputSmall: inputSmall.copyWith(color: color),
    );
  }

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other is! AppTypography) return this;

    return AppTypography(
      displayLarge:
          TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium:
          TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall:
          TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      headlineLarge:
          TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium:
          TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall:
          TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
      inputLarge: TextStyle.lerp(inputLarge, other.inputLarge, t)!,
      inputMedium: TextStyle.lerp(inputMedium, other.inputMedium, t)!,
      inputSmall: TextStyle.lerp(inputSmall, other.inputSmall, t)!,
      buttonLarge: TextStyle.lerp(buttonLarge, other.buttonLarge, t)!,
      buttonMedium:
          TextStyle.lerp(buttonMedium, other.buttonMedium, t)!,
      buttonSmall: TextStyle.lerp(buttonSmall, other.buttonSmall, t)!,
    );
  }

  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }

  AppTypography copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? buttonLarge,
    TextStyle? buttonMedium,
    TextStyle? buttonSmall,
    TextStyle? inputLarge,
    TextStyle? inputMedium,
    TextStyle? inputSmall,
  }) {
    return AppTypography(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      buttonLarge: buttonLarge ?? this.buttonLarge,
      buttonMedium: buttonMedium ?? this.buttonMedium,
      buttonSmall: buttonSmall ?? this.buttonSmall,
      inputLarge: inputLarge ?? this.inputLarge,
      inputMedium: inputMedium ?? this.inputMedium,
      inputSmall: inputSmall ?? this.inputSmall,
    );
  }
}
