import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:clean/features/authentication/data/models/user_model.dart';

import '../../domain/usecases/login.dart';
import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.login) : super(AuthLoginInitial());

  final Login login;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginRequested) {
      try {
        yield AuthLoginLoading();
        final user = await login(LoginParams(event.email, event.password));
        // yield AuthLoginLoaded(user: user.body!.toEntity());
        yield _mapResponseToState(user);
      } on Exception catch (e) {
        yield AuthLoginError(message: e.toString());
      }
    }
  }

  AuthState _mapResponseToState(Response<UserModel> response) {
    return response.statusCode == 200
        ? AuthLoginLoaded(user: response.body!.toEntity())
        : AuthLoginError(message: jsonDecode(response.bodyString)['user_msg']);
  }
}
