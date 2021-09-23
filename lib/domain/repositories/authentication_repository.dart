import '../../data/models/user_model.dart';

abstract class AuthenticationRepository {
  Future<UserModel> login(String email, String password);
}
