import 'package:chopper/chopper.dart';
import 'package:clean/features/authentication/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Response<User>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
