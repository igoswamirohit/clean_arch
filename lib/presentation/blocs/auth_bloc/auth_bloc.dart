import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../domain/usecases/login_usecase.dart';
import '../bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.login) : super(AuthLoginInitial());

  final LoginUseCase login;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginRequested) {
      try {
        yield AuthLoginLoading();
        final user = await login(LoginParams(event.email, event.password));
        yield AuthLoginLoaded(user: user);
      } on Exception catch (e) {
        yield AuthLoginError(message: e.toString());
      }
    }
  }
}
