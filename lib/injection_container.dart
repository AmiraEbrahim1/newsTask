import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/core/api/dio/dio-consumer.dart';
import 'package:http/http.dart';
import 'package:news_app/features/news/data/data_sources/news_remote_datasources.dart';
import 'package:news_app/features/news/data/repositories/news_repo_impl.dart';
import 'package:news_app/features/news/domain/repositories/news_repo.dart';
import 'package:news_app/features/news/domain/use_cases/news_usecase.dart';
import 'package:news_app/features/news/presentation/manager/news_bloc.dart';
import 'package:news_app/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/dio/dio_interceptors.dart';
GetIt getIt = GetIt.instance; /* service locator */
Future<void> init() async {
  getIt.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImplWithDio(client: getIt()));
  getIt.registerLazySingleton<NewsRepo>(() => NewsRepoImpl( newsRemoteDataSource: getIt(),));
  getIt.registerLazySingleton<NewsUseCases>(() => NewsUseCases(newsRepo: getIt()));
  getIt.registerLazySingleton<NewsBloc>(() => NewsBloc(newsUseCases:getIt()));
  /*********************************** network**********************/
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
  getIt.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(
      client: getIt(), dioInterceptor: getIt(), logInterceptor: getIt())
    ..dioInit());
  getIt.registerLazySingleton<Client>(() => Client());
  /*********************************** end of network  ****************************************/
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: getIt()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  /******************************** shared prefs *********************************************************/
  SharedPreferences preferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => preferences);
}
