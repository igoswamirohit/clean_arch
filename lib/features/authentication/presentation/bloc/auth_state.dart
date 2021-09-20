import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/user.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLoginInitial extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginLoaded extends AuthState {
  AuthLoginLoaded({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}

class AuthLoginError extends AuthState {
  AuthLoginError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
