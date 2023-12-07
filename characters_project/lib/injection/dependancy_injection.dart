import 'package:characters_project/bloc_layer/cubit.dart';
import 'package:characters_project/data_layer/repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
//Dio dio=Dio();

void initializeGetIt() {
  getIt.registerLazySingleton<ChactersCubit>(() => ChactersCubit(getIt()));
  getIt.registerLazySingleton<CharactersRepoSitory>(
      () => CharactersRepoSitory(getIt()));
  //getIt.registerLazySingleton<CharactersWebservices>(
  //   ()=>);
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio.options.connectTimeout = Duration(seconds: 20);
  dio.options.receiveTimeout = Duration(seconds: 20);

  dio.interceptors.add(LogInterceptor(
    responseHeader: true,
    responseBody: true,
    error: true,
    request: true,
    requestHeader: true,
    requestBody: true,
  ));

  return dio;
}
