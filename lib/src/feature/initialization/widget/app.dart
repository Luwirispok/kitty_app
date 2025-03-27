import 'package:flutter/material.dart';
import 'package:kitty_app/src/core/layout/device_previewer.dart';
import 'package:kitty_app/src/feature/initialization/logic/composition_root.dart';
import 'package:kitty_app/src/feature/initialization/widget/dependencies_scope.dart';
import 'package:kitty_app/src/feature/initialization/widget/material_context.dart';

class App extends StatelessWidget {
  const App({required this.result, super.key});

  /// The result from the [CompositionRoot].
  final CompositionResult result;

  @override
  Widget build(BuildContext context) => DependenciesScope(
    dependencies: result.dependencies,
    child: DevicePreviewer(child: MaterialContext()),
  );
}
