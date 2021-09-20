import 'package:chopper/chopper.dart';
import 'package:clean/features/authentication/data/models/user_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/service/service.dart';
import '../../domain/entities/user.dart';

abstract class AuthenticationRemoteDataSource {
  /// Calls the http://staging.php-dev.in:8844/trainingapp/api/users/login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Response<UserModel>> login(String email, String password);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final Service service;

  AuthenticationRemoteDataSourceImpl(this.service);

  @override
  Future<Response<UserModel>> login(String email, String password) async {
    return await service.login(email: email, password: password);
  }
}
