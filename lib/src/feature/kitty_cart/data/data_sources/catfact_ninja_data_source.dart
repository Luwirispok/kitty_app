import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/kitty_fact_dto.dart';

part '_generated/catfact_ninja_data_source.g.dart';

abstract interface class CatfactNinjaDataSource {
  /// Получить случайный факт о коте
  Future<HttpResponse<KittyFactDto>> getRandomFactAboutCat();
}

/// Получить случайные факты о котах
///
/// https://catfact.ninja/
@RestApi(baseUrl: 'https://catfact.ninja')
abstract class CatfactNinjaDataSourceImpl implements CatfactNinjaDataSource {
  factory CatfactNinjaDataSourceImpl(Dio dio) = _CatfactNinjaDataSourceImpl;

  /// https://catfact.ninja/fact
  @override
  @GET('/fact')
  Future<HttpResponse<KittyFactDto>> getRandomFactAboutCat();
}
