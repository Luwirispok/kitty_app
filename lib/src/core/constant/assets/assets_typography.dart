import 'package:flutter/material.dart' show FontWeight, TextStyle;
import 'package:google_fonts/google_fonts.dart';

/// Используемые шрифты
///
/// https://www.figma.com/design/uw2O8u2F88sSoPa2DrHhEH/Mobile-UI-Kit-(light%2Fdark)-(Community)?node-id=3895-357677&p=f&t=0t432kejryfJPSMG-0
final class AssetsTypography {
  static final TextStyle display = GoogleFonts.inter(
    fontSize: _getAdaptiveSize(34),
    fontWeight: FontWeight.w600,
    letterSpacing: -1,
    height: _getAdaptiveSize(41 / 34),
  );

  static final TextStyle headline = GoogleFonts.inter(
    fontSize: _getAdaptiveSize(28),
    fontWeight: FontWeight.w500,
    letterSpacing: -1,
    height: _getAdaptiveSize(34 / 28),
  );

  static final TextStyle titleMedium = GoogleFonts.inter(
    fontSize: _getAdaptiveSize(22),
    fontWeight: FontWeight.w500,
    letterSpacing: -1,
    height: _getAdaptiveSize(28 / 22),
  );

  static final TextStyle titleSmall = GoogleFonts.inter(
    fontSize: _getAdaptiveSize(20),
    fontWeight: FontWeight.w500,
    letterSpacing: -0.7,
    height: _getAdaptiveSize(25 / 20),
  );

  static final TextStyle body = GoogleFonts.inter(
    fontSize: _getAdaptiveSize(17),
    fontWeight: FontWeight.w400,
    letterSpacing: -0.5,
    height: 1.1,
  );

  static final TextStyle label = GoogleFonts.inter(
    fontSize: _getAdaptiveSize(13),
    fontWeight: FontWeight.w400,
    height: _getAdaptiveSize(15 / 13),
  );
  static final TextStyle buttonMedium = GoogleFonts.inter(
    fontSize: _getAdaptiveSize(17),
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
    height: _getAdaptiveSize(22 / 17),
  );

  static final TextStyle buttonSmall = GoogleFonts.inter(
    fontSize: _getAdaptiveSize(13),
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
    height: _getAdaptiveSize(18 / 13),
  );

  static final TextStyle input = GoogleFonts.inter(
    fontSize: _getAdaptiveSize(17),
    fontWeight: FontWeight.w400,
    height: _getAdaptiveSize(22 / 17),
  );

  static double _getAdaptiveSize(double size) => size;
}
