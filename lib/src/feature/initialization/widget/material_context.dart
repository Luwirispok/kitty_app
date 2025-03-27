import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitty_app/src/core/router/routes.dart';
import 'package:kitty_app/src/core/utils/extensions/extension.dart';
import 'package:kitty_app/src/core/utils/logger.dart';

/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.

class MaterialContext extends StatefulWidget {
  const MaterialContext({super.key});

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  static final _globalKey = GlobalKey();

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext> {
  late final GoRouter goRouter;

  @override
  void initState() {
    super.initState();
    goRouter = GoRouter(
      initialLocation: KittyCartRoute().location,
      routes: $appRoutes,
      restorationScopeId: 'kitty_app_navigation',
      errorBuilder: errorScreenBuilder,
      observers: [LoggerTalker.l().loggerNavigatorObservers()],
      debugLogDiagnostics: true,
    );
  }

  @override
  void dispose() {
    goRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return MaterialApp.router(
      theme: AppTheme.withThemeMode(ThemeMode.system).lightTheme,
      darkTheme: AppTheme.withThemeMode(ThemeMode.system).darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: goRouter,
      // locale: locale,
      // localizationsDelegates: Localization.localizationDelegates,
      // supportedLocales: Localization.supportedLocales,
      debugShowCheckedModeBanner: kDebugMode,
      builder:
          (context, child) => MediaQuery(
            key: MaterialContext._globalKey,
            data: mediaQueryData.copyWith(
              textScaler: TextScaler.linear(
                mediaQueryData.textScaler.scale(1).clamp(0.5, 2),
              ),
            ),
            child: child!,
          ),
    );
  }
}
