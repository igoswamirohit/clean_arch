part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  LoginRequested(this.email, this.password);

  final String email, password;

  @override
  List<Object> get props => [email, password];
}

class RegisterRequested extends AuthEvent {
  RegisterRequested(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.confirmPassword,
      required this.gender,
      required this.phoneNo});

  final String email,
      password,
      firstName,
      lastName,
      confirmPassword,
      gender,
      phoneNo;

  @override
  List<Object> get props =>
      [email, password, firstName, lastName, confirmPassword, gender, phoneNo];
}
