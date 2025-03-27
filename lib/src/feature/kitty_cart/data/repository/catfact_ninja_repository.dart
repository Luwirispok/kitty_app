import '../data_sources/catfact_ninja_data_source.dart';

abstract interface class CatfactNinjaRepository {
  Future<String> getRandomFactAboutCat();
}

class CatfactNinjaRepositoryImpl implements CatfactNinjaRepository {
  final CatfactNinjaDataSource _catfactNinjaDataSource;

  CatfactNinjaRepositoryImpl(this._catfactNinjaDataSource);

  @override
  Future<String> getRandomFactAboutCat() async {
    final response = await _catfactNinjaDataSource.getRandomFactAboutCat();
    return response.data.fact;
  }
}
