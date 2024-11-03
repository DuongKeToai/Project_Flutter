import 'package:flutter_learning/core/common/data/datasources/global_info_local_data_source.dart';
import 'package:flutter_learning/core/common/data/repositories/global_repository_impl.dart';
import 'package:flutter_learning/core/common/domain/repositories/global_repository.dart';
import 'package:flutter_learning/core/common/domain/usecases/global_info_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../apis/dio_client.dart';
import '../../features/home/data/movie_remote_data_source.dart';
import '../../features/home/repositories/movie_repository_impl.dart';
import '../../features/home/domain/repositories/movie_repository.dart';
import '../common/domain/usecases/movie_usecase.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  //! Đăng ký SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //! Dio Client
  getIt.registerSingleton<DioClient>(DioClient());

  //! Data Source
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(dio: getIt<DioClient>().dio));
  getIt.registerLazySingleton<GlobalInfoLocalDatasource>(
      () => GlobalInfoLocalDataSourceImpl(sharedPreferences: getIt()));

  //! Repository
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton<GlobalRepository>(
      () => GlobalRepositoryImpl(localDatasource: getIt()));

  //! Use cases
  getIt.registerSingleton<GlobalInfoUsecases>(
      GlobalInfoUsecases(repository: getIt(), globalRepository: getIt()));
  getIt.registerSingleton<GetMovies>(GetMovies(getIt()));
}
