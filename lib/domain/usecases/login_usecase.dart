import 'package:clean/core/usecases/usecase.dart';
import 'package:clean/domain/entities/user.dart';
import 'package:clean/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthenticationRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<User> call(LoginParams params) async {
    return repository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
