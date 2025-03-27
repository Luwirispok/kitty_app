import 'package:clock/clock.dart';
import 'package:dio/dio.dart';
import 'package:kitty_app/src/feature/kitty_cart/data/data_sources/catfact_ninja_data_source.dart';
import 'package:kitty_app/src/feature/kitty_cart/data/repository/catfact_ninja_repository.dart';
import 'package:kitty_app/src/feature/kitty_cart/data/repository/http_cat_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:kitty_app/src/core/utils/logger.dart';
import 'package:kitty_app/src/feature/initialization/model/dependencies_container.dart';

/// A place where all dependencies are initialized.
///
/// Composition of dependencies is a process of creating and configuring
/// instances of classes that are required for the application to work.
///
/// It is a good practice to keep all dependencies in one place to make it
/// easier to manage them and to ensure that they are initialized only once.

final class CompositionRoot {
  /// Composes dependencies and returns result of composition.
  Future<CompositionResult> compose() async {
    final stopwatch = clock.stopwatch()..start();

    logger.info('Initializing dependencies...');
    // initialize dependencies

    final DependenciesContainer dependencies = await _createDependencies();

    logger.info('Dependencies initialized');

    stopwatch.stop();
    final result = CompositionResult(
      dependencies: dependencies,
      millisecondsSpent: stopwatch.elapsedMilliseconds,
    );

    return result;
  }

  Future<DependenciesContainer> _createDependencies() async {
    final dependencies = await DependenciesFactory().create();
    return dependencies;
  }
}

/// Result of composition
///

final class CompositionResult {
  const CompositionResult({
    required this.dependencies,
    required this.millisecondsSpent,
  });

  /// The dependencies container
  final DependenciesContainer dependencies;

  /// The number of milliseconds spent
  final int millisecondsSpent;

  @override
  String toString() =>
      '$CompositionResult('
      'dependencies: $dependencies, '
      'millisecondsSpent: $millisecondsSpent'
      ')';
}

/// Factory that creates an instance of [T].

abstract class Factory<T> {
  /// Creates an instance of [T].
  T create();
}

/// Factory that creates an instance of [T] asynchronously.

abstract class AsyncFactory<T> {
  /// Creates an instance of [T].
  Future<T> create();
}

/// Factory that creates an instance of [DependenciesContainer].

class DependenciesFactory extends AsyncFactory<DependenciesContainer> {
  DependenciesFactory();

  @override
  Future<DependenciesContainer> create() async {
    /// Зависимости
    final Dio dio =
        Dio()..interceptors.add(LoggerTalker.l().loggerInterceptorDio());

    /// Data sources
    final CatfactNinjaDataSource catfactNinjaDataSource =
        CatfactNinjaDataSourceImpl(dio);

    /// Repositories
    final CatfactNinjaRepository catfactNinjaRepository =
        CatfactNinjaRepositoryImpl(catfactNinjaDataSource);
    final HttpCatRepository httpCatRepository = HttpCatRepositoryImpl();

    /// Real dependencies
    final packageInfo = await PackageInfo.fromPlatform();

    return DependenciesContainer(
      packageInfo: packageInfo,
      httpCatRepository: httpCatRepository,
      catfactNinjaRepository: catfactNinjaRepository,
    );
  }
}
