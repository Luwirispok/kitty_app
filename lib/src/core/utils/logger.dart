import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

Talker get logger => LoggerTalker.l().logger();

class LoggerTalker {
  final Talker _talker = TalkerFlutter.init(
    logger: TalkerLogger(
      settings: TalkerLoggerSettings(enableColors: false),
      formatter: ColoredLoggerFormatter(),
    ),
    settings: TalkerSettings(
      titles: {
        TalkerLogType.debug.name: '🐛 Debug',
        TalkerLogType.info.name: '💡 Info',
        TalkerLogType.warning.name: '⚠️ Warning',
        TalkerLogType.error.name: '⛔ Error',
        TalkerLogType.exception.name: '🚨 Exception',
        TalkerLogType.critical.name: '🔥 Critical error',
        TalkerLogType.verbose.name: '💬 Verbose',
        TalkerLogType.route.name: '🚦 Route',
        TalkerLogType.blocClose.name: '🔒 Bloc-close',
        TalkerLogType.blocEvent.name: '📣 Bloc-event',
        TalkerLogType.blocCreate.name: '🆕 Bloc-create',
        TalkerLogType.blocTransition.name: '🚀 Bloc-transition',
        TalkerLogType.httpRequest.name: '🌐📤 http-request',
        TalkerLogType.httpResponse.name: '🌐💡 http-response',
        TalkerLogType.httpError.name: '🌐⛔ http-error',
      },
    ),
  );

  static final LoggerTalker _logger = LoggerTalker._();

  LoggerTalker._();

  factory LoggerTalker.l() => _logger;

  Talker logger() => _talker;

  void logZoneError(Object error, StackTrace stackTrace) => _talker.log(
    'Zone error',
    logLevel: LogLevel.error,
    exception: error,
    stackTrace: stackTrace,
  );

  BlocObserver loggerBlocObserver() {
    return TalkerBlocObserver(
      talker: _talker,
      settings: const TalkerBlocLoggerSettings(
        enabled: true,
        printEventFullData: false,
        printStateFullData: false,
        printChanges: false,
        printClosings: true,
        printCreations: true,
        printEvents: true,
        printTransitions: true,
      ),
    );
  }

  Interceptor loggerInterceptorDio() {
    return TalkerDioLogger(talker: _talker);
  }

  TalkerScreen loggerScreen() {
    return TalkerScreen(talker: _talker);
  }

  TalkerRouteObserver loggerNavigatorObservers() {
    return TalkerRouteObserver(_talker);
  }
}

class ColoredLoggerFormatter implements LoggerFormatter {
  @override
  String fmt(LogDetails details, TalkerLoggerSettings settings) {
    ConsoleUtils.getTopline(
      settings.maxLineWidth,
      lineSymbol: settings.lineSymbol,
      withCorner: true,
    );
    final msg = details.message?.toString() ?? '';

    final Iterable<String> msgList = msg.split('\n').map((e) => '│ $e');
    Iterable<String> linesColored = [msgList.first];
    if (settings.enableColors) {
      linesColored = linesColored.map((e) => details.pen.write(e));
    }
    Iterable<String> lines = [...linesColored, ...msgList.skip(1)];
    final coloredMsg = lines.join('\n');
    return coloredMsg;
  }
}
