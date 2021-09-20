import 'package:chopper/chopper.dart';
import 'package:clean/features/authentication/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/authentication_repository.dart';

class Login implements UseCase<User, LoginParams> {
  final AuthenticationRepository repository;

  Login(this.repository);

  @override
  Future<Response<UserModel>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
