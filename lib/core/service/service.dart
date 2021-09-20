import "dart:async";

import 'package:chopper/chopper.dart';
import 'package:clean/core/util/jsonToTypeConverter.dart';
import 'package:clean/features/authentication/data/models/user_model.dart';

import 'api_constants.dart';

part 'service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class Service extends ChopperService {
  static Service create() {
    final client = ChopperClient(
        baseUrl: ApiConstants.BASE_URL,
        services: [_$Service()],
        converter: JsonSerializableConverter({
          UserModel: (jsonData) => UserModel.fromJson(jsonData['data']),
        }),
        interceptors: [
          HttpLoggingInterceptor(),
        ]);
    return _$Service(client);
  }

  @Post(path: ApiConstants.LOGIN)
  @FactoryConverter(
    request: FormUrlEncodedConverter.requestFactory,
  )
  Future<Response<UserModel>> login({
    @Field('email') required String email,
    @Field('password') required String password,
  });
}
