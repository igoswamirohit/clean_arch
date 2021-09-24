import 'package:chopper/chopper.dart';

import '../../../../core/service/link_outside_world.dart';
import '../../../core/constants/api_constants.dart';
import '../../models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  /// Calls the http://staging.php-dev.in:8844/trainingapp/api/users/login endpoint.
  Future<UserModel> login(String email, String password);

  /// Calls the http://staging.php-dev.in:8844/trainingapp/api/users/register endpoint.
  Future register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String confirmPassword,
      required String gender,
      required String phoneNo});
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

  @override
  Future register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String confirmPassword,
      required String gender,
      required String phoneNo}) async {
    return await service.request(
        url: ApiConstants.REGISTER,
        method: 'POST',
        isMultipart: true,
        partValue: [
          PartValue('email', email),
          PartValue('password', password),
          PartValue('confirm_password', confirmPassword),
          PartValue('first_name', firstName),
          PartValue('last_name', lastName),
          PartValue('gender', gender),
          PartValue('phone_no', phoneNo),
        ]);
  }
}
