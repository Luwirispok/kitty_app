import 'package:kitty_app/src/feature/kitty_cart/data/repository/catfact_ninja_repository.dart';
import 'package:kitty_app/src/feature/kitty_cart/data/repository/http_cat_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:kitty_app/src/feature/initialization/logic/composition_root.dart';

/// Composed dependencies from the [CompositionRoot].
///
/// This class contains all the dependencies that are required for the application
/// to work.

class DependenciesContainer {
  const DependenciesContainer({
    required this.httpCatRepository,
    required this.catfactNinjaRepository,
    required this.packageInfo,
  });

  /// [PackageInfo] instance, contains information about the application.
  final PackageInfo packageInfo;

  final HttpCatRepository httpCatRepository;
  final CatfactNinjaRepository catfactNinjaRepository;
}
