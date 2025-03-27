import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kitty_app/src/core/constant/assets/assets_shadow.dart';

import '../../constant/assets/assets_color.dart';
import '../../constant/assets/assets_typography.dart';
import 'app_colors.dart';
import 'app_shadows.dart';
import 'app_typography.dart';

/// An immutable class that holds properties needed
/// to build a [ThemeData] for the app.
abstract interface class _AppThemeWithExtensions {
  /// The type of theme to use.
  abstract final ThemeMode themeMode;

  /// The [ThemeData] for this [AppTheme].
  abstract final ThemeData theme;

  /// Extensions [Color] for [ThemeData]
  abstract final AppColors colorExtensionTheme;

  /// Extensions [TextStyle] for [ThemeData]
  abstract final AppTypography textStyleExtensionTheme;

  /// Extensions [BoxShadow] for [ThemeData]
  abstract final AppShadows shadowExtensionTheme;
}

/// The [AppTheme] for the app.
@immutable
sealed class AppTheme with Diagnosticable implements _AppThemeWithExtensions {
  @override
  final ThemeMode themeMode;

  AppTheme([this.themeMode = ThemeMode.system]);

  factory AppTheme.withThemeMode([ThemeMode themeMode = ThemeMode.system]) {
    return computeAppTheme(themeMode);
  }

  /// The [ThemeData] for this [AppTheme].
  /// This is computed based on the [themeMode].
  ThemeData computeTheme() => computeAppTheme(themeMode).theme;

  /// The [ThemeData] for the light theme.
  ThemeData get lightTheme => LightAppTheme().theme;

  /// The [ThemeData] for the dark theme.
  ThemeData get darkTheme => DarkAppTheme().theme;

  static AppTheme computeAppTheme(ThemeMode themeMode) => switch (themeMode) {
    ThemeMode.dark => LightAppTheme(),
    ThemeMode.light => DarkAppTheme(),
    ThemeMode.system =>
      PlatformDispatcher.instance.platformBrightness == Brightness.dark
          ? DarkAppTheme()
          : LightAppTheme(),
  };

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<ThemeMode>('type', themeMode));
    properties.add(DiagnosticsProperty<ThemeData>('lightTheme', lightTheme));
    properties.add(DiagnosticsProperty<ThemeData>('darkTheme', darkTheme));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppTheme && themeMode == other.themeMode;

  @override
  int get hashCode => Object.hash(themeMode, theme);
}

/// The light [ThemeData] for this [AppTheme].
@immutable
final class LightAppTheme extends AppTheme {
  LightAppTheme([super.themeMode = ThemeMode.light]);

  @override
  ThemeData get theme => ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: colorExtensionTheme.background,
    colorScheme: colorExtensionTheme.toColorScheme(Brightness.light),
    canvasColor: colorExtensionTheme.background,
    splashColor: colorExtensionTheme.background,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textStyleExtensionTheme.toTextTheme(),
    extensions: <ThemeExtension<dynamic>>[
      colorExtensionTheme,
      textStyleExtensionTheme,
      shadowExtensionTheme,
    ],
  );

  @override
  AppTypography get textStyleExtensionTheme => AppTypography.withColor(
    colorExtensionTheme.textPrimary,
    displayLarge: AssetsTypography.display,
    displayMedium: AssetsTypography.display,
    displaySmall: AssetsTypography.display,
    headlineLarge: AssetsTypography.headline,
    headlineMedium: AssetsTypography.headline,
    headlineSmall: AssetsTypography.headline,
    titleLarge: AssetsTypography.titleMedium,
    titleMedium: AssetsTypography.titleMedium,
    titleSmall: AssetsTypography.titleSmall,
    bodyLarge: AssetsTypography.body,
    bodyMedium: AssetsTypography.body,
    bodySmall: AssetsTypography.body,
    labelLarge: AssetsTypography.label,
    labelMedium: AssetsTypography.label,
    labelSmall: AssetsTypography.label,
    buttonLarge: AssetsTypography.buttonMedium,
    buttonMedium: AssetsTypography.buttonMedium,
    buttonSmall: AssetsTypography.buttonSmall,
    inputLarge: AssetsTypography.input,
    inputMedium: AssetsTypography.input,
    inputSmall: AssetsTypography.input,
  );

  @override
  AppColors get colorExtensionTheme => AppColors(
    red: AssetsLightColor.red,
    orange: AssetsLightColor.orange,
    green: AssetsLightColor.green,
    blue: AssetsLightColor.blue,
    black: AssetsLightColor.black_1000,
    white: AssetsLightColor.white_500,
    error: AssetsLightColor.red,
    warning: AssetsLightColor.orange,
    positive: AssetsLightColor.green,
    accent: AssetsLightColor.green,
    surface: AssetsLightColor.white_400,
    background: AssetsLightColor.white_500,
    tertiary: AssetsLightColor.black_400,
    secondary: AssetsLightColor.grey_600,
    primary: AssetsLightColor.black_1000,
    textPrimary: AssetsLightColor.black_1000,
    textSecondary: AssetsLightColor.grey_600,
    textAccent: AssetsLightColor.blue,
    textOnAccent: AssetsLightColor.white_500,
  );

  @override
  AppShadows get shadowExtensionTheme =>
      AppShadows(shadow_1: AssetsShadow.shadow_1);
}

/// The dark [ThemeData] for this [AppTheme].
@immutable
final class DarkAppTheme extends AppTheme {
  DarkAppTheme([super.themeMode = ThemeMode.dark]);

  @override
  ThemeData get theme => ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: colorExtensionTheme.background,
    colorScheme: colorExtensionTheme.toColorScheme(Brightness.dark),
    canvasColor: colorExtensionTheme.background,
    splashColor: colorExtensionTheme.background,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textStyleExtensionTheme.toTextTheme(),
    extensions: <ThemeExtension<dynamic>>[
      colorExtensionTheme,
      textStyleExtensionTheme,
      shadowExtensionTheme,
    ],
  );

  @override
  AppTypography get textStyleExtensionTheme => AppTypography.withColor(
    colorExtensionTheme.textPrimary,
    displayLarge: AssetsTypography.display,
    displayMedium: AssetsTypography.display,
    displaySmall: AssetsTypography.display,
    headlineLarge: AssetsTypography.headline,
    headlineMedium: AssetsTypography.headline,
    headlineSmall: AssetsTypography.headline,
    titleLarge: AssetsTypography.titleMedium,
    titleMedium: AssetsTypography.titleMedium,
    titleSmall: AssetsTypography.titleSmall,
    bodyLarge: AssetsTypography.body,
    bodyMedium: AssetsTypography.body,
    bodySmall: AssetsTypography.body,
    labelLarge: AssetsTypography.label,
    labelMedium: AssetsTypography.label,
    labelSmall: AssetsTypography.label,
    buttonLarge: AssetsTypography.buttonMedium,
    buttonMedium: AssetsTypography.buttonMedium,
    buttonSmall: AssetsTypography.buttonSmall,
    inputLarge: AssetsTypography.input,
    inputMedium: AssetsTypography.input,
    inputSmall: AssetsTypography.input,
  );

  @override
  AppColors get colorExtensionTheme => AppColors(
    red: AssetsDarkColor.red,
    orange: AssetsDarkColor.orange,
    green: AssetsDarkColor.green,
    blue: AssetsDarkColor.blue,
    black: AssetsDarkColor.black_1000,
    white: AssetsDarkColor.white_500,
    error: AssetsDarkColor.red,
    warning: AssetsDarkColor.orange,
    positive: AssetsDarkColor.green,
    accent: AssetsDarkColor.green,
    surface: AssetsDarkColor.black_800,
    background: AssetsDarkColor.black_1000,
    tertiary: AssetsDarkColor.black_900,
    secondary: AssetsDarkColor.white_400,
    primary: AssetsDarkColor.white_500,
    textPrimary: AssetsDarkColor.white_500,
    textSecondary: AssetsDarkColor.white_400,
    textAccent: AssetsDarkColor.green,
    textOnAccent: AssetsDarkColor.white_500,
  );

  @override
  AppShadows get shadowExtensionTheme =>
      AppShadows(shadow_1: AssetsShadow.shadow_1);
}
