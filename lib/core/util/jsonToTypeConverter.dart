import 'dart:developer';

import 'package:chopper/chopper.dart';

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, Function(Map<dynamic, dynamic>)> factories;

  JsonSerializableConverter(this.factories);

  T? _decodeMap<T>(Map<dynamic, dynamic> values) {
    /// Get jsonFactory using Type parameters
    /// if not found or invalid, throw error or return null
    final jsonFactory = factories[T];
    if (jsonFactory == null) {
      /// throw serializer not found error;
      return null;
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(List values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

  dynamic _decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity.toList());

    if (entity is Map) return _decodeMap<T>(entity);

    return entity;
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    // use [JsonConverter] to decode json
    final jsonRes = super.convertResponse(response);

    log(jsonRes
        .copyWith<ResultType>(body: _decode<ResultType>(jsonRes.body))
        .toString());

    return jsonRes.copyWith<ResultType>(
        body: _decode<ResultType>(jsonRes.body));
  }
}
