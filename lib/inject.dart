import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'constants/strings.dart';
import 'data/web_servicess/character_web_services.dart';

final locator =GetIt.instance;

void setUp(){
  locator.registerLazySingleton<CharactersWebServices>(() => CharactersWebServices(createDio()));
}


Dio createDio(){
    Dio dio=Dio(
    BaseOptions(
      baseUrl: baseUrlApi,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout:const Duration(seconds: 20),
      receiveDataWhenStatusError: true,
    )
  );
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    )
    );
    return dio;
}
