import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/auth_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.login, this.register) : super(AuthLoginInitial());

  final LoginUseCase login;
  final RegisterUseCase register;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginRequested) {
      try {
        yield AuthLoginProgress();
        final user = await login(LoginParams(event.email, event.password));
        yield AuthLoginSuccess(user: user);
      } on Exception catch (e) {
        yield AuthLoginFailure(message: e.toString());
      }
    } else if (event is RegisterRequested) {
      try {
        yield AuthRegisterProgress();
        final user = await register(RegisterParams(
            email: event.email,
            password: event.password,
            firstName: event.firstName,
            lastName: event.lastName,
            confirmPassword: event.confirmPassword,
            gender: event.gender,
            phoneNo: event.phoneNo));
        yield AuthRegisterSuccess(user: user);
      } on Exception catch (e) {
        yield AuthRegisterFailure(message: e.toString());
      }
    }
  }
}
