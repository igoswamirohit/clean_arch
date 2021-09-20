import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/service/service.dart';
import 'features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'features/authentication/data/repositories/authentication_repository_impl.dart';
import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/login.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Login
  // Bloc
  sl.registerFactory(
    () => AuthBloc(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => Login(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(sl()),
  );

  //Service
  sl.registerLazySingleton<Service>(() => Service.create());

  // sl.registerLazySingleton<>(
  //   () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  // );

  //! Core
  // sl.registerLazySingleton(() => InputConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
