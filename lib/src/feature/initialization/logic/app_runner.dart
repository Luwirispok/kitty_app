import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart'
    as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/src/core/utils/logger.dart';
import 'package:kitty_app/src/feature/initialization/logic/composition_root.dart';
import 'package:kitty_app/src/feature/initialization/widget/app.dart';
import 'package:kitty_app/src/feature/initialization/widget/initialization_failed_app.dart';

/// A class which is responsible for initialization and running the app.

final class AppRunner {
  const AppRunner();

  /// Start the initialization and in case of success run application
  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    // Preserve splash screen
    binding.deferFirstFrame();

    // Setup bloc observer and transformer
    Bloc.observer = LoggerTalker.l().loggerBlocObserver();
    Bloc.transformer = bloc_concurrency.sequential();

    Future<void> initializeAndRun() async {
      try {
        final result = await CompositionRoot().compose();
        // Attach this widget to the root of the tree.
        runApp(App(result: result));
      } catch (e, stackTrace) {
        logger.error('Initialization failed', e, stackTrace);
        runApp(
          InitializationFailedApp(
            error: e,
            stackTrace: stackTrace,
            onRetryInitialization: initializeAndRun,
          ),
        );
      } finally {
        // Allow rendering
        binding.allowFirstFrame();
      }
    }

    // Run the app
    await initializeAndRun();
  }
}
