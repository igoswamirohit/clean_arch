import 'package:chopper/chopper.dart';
import 'package:clean/features/authentication/data/models/user_model.dart';

abstract class AuthenticationRepository {
  Future<Response<UserModel>> login(String email, String password);
}
