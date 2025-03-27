import 'package:flutter/material.dart';

/// Application shadows

class AppShadows extends ThemeExtension<AppShadows> {
  final BoxShadow shadow_1;

  const AppShadows({required this.shadow_1});

  @override
  ThemeExtension<AppShadows> lerp(
    covariant ThemeExtension<AppShadows>? other,
    double t,
  ) {
    if (other is! AppShadows) return this;
    return AppShadows(shadow_1: BoxShadow.lerp(shadow_1, other.shadow_1, t)!);
  }

  @override
  AppShadows copyWith({BoxShadow? shadow_1}) {
    return AppShadows(shadow_1: shadow_1 ?? this.shadow_1);
  }
}
