import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kitty_app/src/core/widget/text.dart';
import 'package:kitty_app/src/feature/initialization/widget/dependencies_scope.dart';
import 'package:kitty_app/src/feature/kitty_cart/presentation/bloc/bloc/kitty_cart_bloc.dart';
import 'package:kitty_app/src/feature/kitty_cart/presentation/kitty_cart_screen.dart';

part '_generated/routes.g.dart';

@TypedGoRoute<KittyCartRoute>(path: '/kitty_cart')
class KittyCartRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<KittyCartBloc>(
      create:
          (context) => KittyCartBloc(
            catfactNinjaRepository:
                DependenciesScope.of(context).catfactNinjaRepository,
            httpCatRepository: DependenciesScope.of(context).httpCatRepository,
          ),
      child: const KittyCartScreen(),
    );
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _pageRoute(child: build(context, state));
  }
}

Page<dynamic> _pageRoute({required Widget child}) {
  if (Platform.isMacOS || Platform.isIOS) {
    return CupertinoPage(child: child);
  }
  return MaterialPage(child: child);
}

/////////////
Widget errorScreenBuilder(BuildContext context, GoRouterState state) =>
    const ErrorScreen();

/// Screen to be shown when the route is not found.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            UiText.headlineMedium('Error: 404'),
            UiText.titleMedium('Route not found. Экран не найден.'),
          ],
        ),
      ),
    ),
  );
}
