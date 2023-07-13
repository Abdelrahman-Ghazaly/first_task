import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:first_assignment/caching/sql_database/database_helper.dart';
import 'package:first_assignment/core/network/network_info.dart';
import 'package:first_assignment/features/home/data/data_sources/home_local_data_source.dart';
import 'package:first_assignment/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:first_assignment/features/home/data/repositories/home_repository_impl.dart';
import 'package:first_assignment/features/home/domain/repositories/home_repository.dart';
import 'package:first_assignment/features/home/domain/use_cases/get_friends_use_case.dart';
import 'package:first_assignment/features/home/domain/use_cases/get_sponsers_use_case.dart';
import 'package:first_assignment/features/home/presentation/provider/friends_provider.dart';
import 'package:first_assignment/features/home/presentation/provider/sponser_provider.dart';
import 'package:first_assignment/features/log_in/data/data_sources/log_in_remote_data_source.dart';
import 'package:first_assignment/features/log_in/data/repositories/log_in_repository_impl.dart';
import 'package:first_assignment/features/log_in/domain/repositories/log_in_repository.dart';
import 'package:first_assignment/features/log_in/domain/use_cases/log_in_use_case.dart';
import 'package:first_assignment/features/log_in/presentation/cubit/log_in_cubit.dart';
import 'package:first_assignment/features/log_in/presentation/provider/log_in_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  initProvider();
  initFeatuers();
  initRepository();
  initDataSources();
  initHelperClasses();
  initExternalPackages();
}

void initProvider() {
  sl.registerFactory(() => LogInProvider(logInUseCase: sl<LogInUseCase>()));
  sl.registerFactory(
    () => FriendsProvider(getFriendsUseCase: sl<GetFriendsUseCase>()),
  );
  sl.registerFactory(
    () => SponserProvider(getSponsersUseCase: sl<GetSponsersUseCase>()),
  );
}

initCubit() {
  sl.registerFactory(() => LogInCubit(logInUseCase: sl<LogInUseCase>()));
}

void initFeatuers() {
  sl.registerLazySingleton(
    () => LogInUseCase(repository: sl<LogInRepository>()),
  );

  sl.registerLazySingleton(
    () => GetFriendsUseCase(repository: sl<HomeRepository>()),
  );
  sl.registerLazySingleton(
    () => GetSponsersUseCase(repository: sl<HomeRepository>()),
  );
}

void initRepository() {
  sl.registerLazySingleton<LogInRepository>(
    () => LogInRepositoryImpl(
      remoteDataSource: sl<LogInRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl<HomeRemoteDataSource>(),
      localDataSource: sl<HomeLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );
}

void initDataSources() {
  sl.registerLazySingleton<LogInRemoteDataSource>(
    () => LogInRemoteDataSourceImpl(dio: sl<Dio>()),
  );

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      dio: sl<Dio>(),
      localDataSource: sl<HomeLocalDataSource>(),
    ),
  );

  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(database: sl<DatabaseHelper>()),
  );
}

void initHelperClasses() async {
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl<DataConnectionChecker>()));

  sl.registerLazySingleton(() => DatabaseHelper());
}

void initExternalPackages() {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
}
