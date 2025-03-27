import 'dart:async';

import 'src/core/utils/logger.dart';
import 'src/feature/initialization/logic/app_runner.dart';

void main() {
  runZonedGuarded(
    () => AppRunner().initializeAndRun(),
    LoggerTalker.l().logZoneError,
  );
}
