import '../../data/models/user_model.dart';

abstract class AuthenticationRepository {
  Future<UserModel> login(String email, String password);
  Future register({required String email, required String password, required String firstName,
      required String lastName, required String confirmPassword, required String gender, required String phoneNo});
}
