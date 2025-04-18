import 'package:flutter/material.dart';

import '../theme/theme.dart';

/// A widget that displays a string of text with a specific style.
class UiText extends StatelessWidget {
  const UiText(
    this.data, {
    this.color,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    TextStyle? Function(AppTypography)? styleBuilder,
    super.key,
  }) : _styleBuilder = styleBuilder;

  /// Creates a [UiText] widget with a large display size.
  factory UiText.displayLarge(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.displayLarge,
    key: key,
  );

  /// Creates a [UiText] widget with a medium display size.
  factory UiText.displayMedium(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.displayMedium,
    key: key,
  );

  /// Creates a [UiText] widget with a small display size.
  factory UiText.displaySmall(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.displaySmall,
    key: key,
  );

  /// Creates a [UiText] widget with a large headline size.
  factory UiText.headlineLarge(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.headlineLarge,
    key: key,
  );

  /// Creates a [UiText] widget with a medium headline size.
  factory UiText.headlineMedium(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.headlineMedium,
    key: key,
  );

  /// Creates a [UiText] widget with a small headline size.
  factory UiText.headlineSmall(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.headlineSmall,
    key: key,
  );

  /// Creates a [UiText] widget with a large title size.
  factory UiText.titleLarge(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.titleLarge,
    key: key,
  );

  /// Creates a [UiText] widget with a medium title size.
  factory UiText.titleMedium(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.titleMedium,
    key: key,
  );

  /// Creates a [UiText] widget with a small title size.
  factory UiText.titleSmall(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.titleSmall,
    key: key,
  );

  /// Creates a [UiText] widget with a large body size.
  factory UiText.bodyLarge(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.bodyLarge,
    key: key,
  );

  /// Creates a [UiText] widget with a medium body size.
  factory UiText.bodyMedium(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.bodyMedium,
    key: key,
  );

  /// Creates a [UiText] widget with a small body size.
  factory UiText.bodySmall(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.bodySmall,
    key: key,
  );

  /// Creates a [UiText] widget with a large label size.
  factory UiText.labelLarge(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.labelLarge,
    key: key,
  );

  /// Creates a [UiText] widget with a medium label size.
  factory UiText.labelMedium(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.labelMedium,
    key: key,
  );

  /// Creates a [UiText] widget with a small label size.
  factory UiText.labelSmall(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.labelSmall,
    key: key,
  );

  /// Creates a [UiText] widget with a large button size.
  factory UiText.buttonLarge(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.buttonLarge,
    key: key,
  );

  /// Creates a [UiText] widget with a medium button size.
  factory UiText.buttonMedium(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.buttonMedium,
    key: key,
  );

  /// Creates a [UiText] widget with a small button size.
  factory UiText.buttonSmall(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.buttonSmall,
    key: key,
  );

  /// Creates a [UiText] widget with a large input size.
  factory UiText.inputLarge(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.inputLarge,
    key: key,
  );

  /// Creates a [UiText] widget with a medium input size.
  factory UiText.inputMedium(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.inputMedium,
    key: key,
  );

  /// Creates a [UiText] widget with a small input size.
  factory UiText.inputSmall(
    String data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.inputSmall,
    key: key,
  );

  /// The text to display.
  final String data;

  /// The style to apply to the text.
  final TextStyle? style;

  /// The alignment of the text.
  final TextAlign? textAlign;

  /// The overflow behavior of the text.
  final TextOverflow? overflow;

  /// The maximum number of lines to display.
  final int? maxLines;

  /// The color of the text.
  final Color? color;

  /// A function that builds the text style based on the typography.
  final TextStyle? Function(AppTypography)? _styleBuilder;

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final palette = Theme.of(context).appColor;

    // Get the text style based on the size
    final style = _styleBuilder?.call(typography) ?? typography.bodyMedium;

    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      style: style.copyWith(color: color ?? palette.textPrimary),
    );
  }
}
