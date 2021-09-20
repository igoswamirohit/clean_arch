// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$Service extends Service {
  _$Service([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Service;

  @override
  Future<Response<UserModel>> login(
      {required String email, required String password}) {
    final $url = '/trainingapp/api/users/login';
    final $body = <String, dynamic>{'email': email, 'password': password};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<UserModel, UserModel>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }
}
