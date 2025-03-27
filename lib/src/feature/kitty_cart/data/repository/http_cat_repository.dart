import 'dart:math';

abstract interface class HttpCatRepository {
  Future<String> getUrlRandomImageAboutCat([int? statusCode]);
}

class HttpCatRepositoryImpl implements HttpCatRepository {
  final random = Random();

  // Решил не делать UseCase, чтобы не плодить папки
  // (хотя их и так уже много для проекта с одним экраном:) )
  //
  // Если бы из http.cat приходил json с ссылкой на картинку, то был бы и DataSource,
  // а так оно не требуется.
  // Но и в Bloc переносить не хотел
  @override
  Future<String> getUrlRandomImageAboutCat([int? statusCode]) async {
    int status = statusCode ?? statusCodes[random.nextInt(statusCodes.length)];
    return 'https://http.cat/$status';
  }
}

final statusCodes = [
  100,
  101,
  102,
  103,
  200,
  201,
  202,
  203,
  204,
  205,
  206,
  207,
  208,
  214,
  226,
  300,
  301,
  302,
  303,
  304,
  305,
  307,
  308,
  400,
  401,
  402,
  403,
  404,
  405,
  406,
  407,
  408,
  409,
  410,
  411,
  412,
  413,
  414,
  415,
  416,
  417,
  418,
  419,
  420,
  421,
  422,
  423,
  424,
  425,
  426,
  428,
  429,
  431,
  444,
  450,
  451,
  495,
  496,
  497,
  498,
  499,
  500,
  501,
  502,
  503,
  504,
  506,
  507,
  508,
  509,
  510,
  511,
  521,
  522,
  523,
  525,
  530,
  599,
];
