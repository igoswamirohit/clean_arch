import 'package:equatable/equatable.dart';

import '../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/authentication_repository.dart';

///Callable Class - Can be directly called as: 
///final loginUseCase = LoginUseCase();
///final params = LoginParams(email,password);
///----> loginUseCase(params);
class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthenticationRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<User> call(LoginParams params) async {
    return repository.login(params.email, params.password);
  }
}

///Callable Class
class RegisterUseCase implements UseCase<dynamic, RegisterParams> {
  final AuthenticationRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future call(RegisterParams params) async {
    return repository.register(email: params.email, password: params.password, firstName: params.firstName, lastName: params.lastName, confirmPassword: params.confirmPassword, gender: params.gender, phoneNo: params.phoneNo);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class RegisterParams extends Equatable {
  final String email,
      password,
      firstName,
      lastName,
      confirmPassword,
      gender,
      phoneNo;

  RegisterParams(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.confirmPassword,
      required this.gender,
      required this.phoneNo});

  @override
  List<Object> get props => [email, password];
}
