import 'package:chopper/chopper.dart';

import '../../../../core/service/api_constants.dart';
import '../../../../core/service/link_outside_world.dart';
import '../models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  /// Calls the http://staging.php-dev.in:8844/trainingapp/api/users/login endpoint.
  Future<UserModel> login(String email, String password);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImpl(this.service);

  final LinkToOutSideWorld service;

  @override
  Future<UserModel> login(String email, String password) async {
    return await service.request<UserModel>(
        url: ApiConstants.LOGIN,
        method: 'POST',
        isMultipart: true,
        partValue: [
          PartValue('email', email),
          PartValue('password', password),
        ]);
  }
}
