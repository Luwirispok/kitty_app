import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_shadows.dart';
import 'app_typography.dart';

extension ThemeDataExtensions on ThemeData {
  AppColors get appColor => extension<AppColors>()!;

  AppTypography get appTypography => extension<AppTypography>()!;

  AppShadows get appShadows => extension<AppShadows>()!;
}

typedef BuilderTheme = Color Function(ThemeData theme);

/// Билдер цвета через функцию, которая возвращает [Color]
///
/// Не требует наличия BuildContext
typedef BuilderAppColor = Color Function(AppColors color);

/// Билдер стилей текста через функцию, которая возвращает [TextStyle]
///
/// Не требует наличия BuildContext
typedef BuilderAppTypography = TextStyle Function(AppTypography typography);

/// Билдер теней через функцию, которая возвращает [List]<[BoxShadow]>
///
/// Не требует наличия BuildContext
typedef BuilderAppShadows = List<BoxShadow> Function(AppShadows shadows);

/// Билдер иконок через функцию, которая возвращает [Widget]
///
/// Не требует наличия BuildContext
typedef BuilderAppIcon = Widget Function(Color color);
