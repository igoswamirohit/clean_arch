import 'package:chopper/chopper.dart';
import 'package:clean/features/authentication/data/models/user_model.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Response<UserModel>> login(String email, String password) async {
    return remoteDataSource.login(email, password);
  }
}
