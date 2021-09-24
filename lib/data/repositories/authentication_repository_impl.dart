import '../../domain/repositories/authentication_repository.dart';
import '../datasources/authentication/authentication_remote_data_source.dart';
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

  @override
  Future register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String confirmPassword,
      required String gender,
      required String phoneNo}) {
    return remoteDataSource.register(
        email: email,
        confirmPassword: confirmPassword,
        firstName: firstName,
        gender: gender,
        lastName: lastName,
        password: password,
        phoneNo: phoneNo);
  }
}
