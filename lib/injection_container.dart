import 'package:clean/data/datasources/products/proucts_remote_datasource.dart';
import 'package:clean/data/repositories/product_repository.dart';
import 'package:clean/domain/repositories/product_repository.dart';
import 'package:clean/domain/usecases/products_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/service/link_outside_world.dart';
import 'data/datasources/authentication/authentication_remote_data_source.dart';
import 'data/repositories/authentication_repository_impl.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/usecases/auth_usecases.dart';
import 'presentation/blocs/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Authentication - Start

  // Bloc
  sl.registerFactory(
    () => AuthBloc(sl(), sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(sl()),
  );

  // Feature - Authentication End


// Feature - Products
    // Bloc
  sl.registerFactory(
    () => ProductsBloc(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => FetchProductsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(sl()),
  );

  // Feature - Products End

  //Service
  sl.registerLazySingleton<LinkToOutSideWorld>(() => LinkToOutSideWorld());

  //! Core
  // sl.registerLazySingleton(() => InputConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
