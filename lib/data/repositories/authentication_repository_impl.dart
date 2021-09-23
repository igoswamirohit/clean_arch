
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/authentication_remote_data_source.dart';
import '../models/user_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<UserModel> login(String email, String password) async {
    return remoteDataSource.login(email, password);
  }
}
