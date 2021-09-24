part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLoginInitial extends AuthState {}

class AuthLoginProgress extends AuthState {}

class AuthLoginSuccess extends AuthState {
  AuthLoginSuccess({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}

class AuthLoginFailure extends AuthState {
  AuthLoginFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class AuthRegisterProgress extends AuthState {}

class AuthRegisterSuccess extends AuthState {
  AuthRegisterSuccess({required this.user});

  final user;

  @override
  List<Object> get props => [user];
}

class AuthRegisterFailure extends AuthState {
  AuthRegisterFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
