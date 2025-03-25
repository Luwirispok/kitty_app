import 'package:flutter/material.dart' show BoxShadow, Color, Offset;

/// Используемые тени
///
/// https://www.figma.com/design/uw2O8u2F88sSoPa2DrHhEH/Mobile-UI-Kit-(light%2Fdark)-(Community)?node-id=3895-357677&p=f&t=0t432kejryfJPSMG-0
final class AssetsShadow {
  static BoxShadow shadow_1 = BoxShadow(
    offset: Offset(0, 15),
    blurRadius: 20,
    color: Color(0xff000000).withValues(alpha: 0.05),
  );
}
