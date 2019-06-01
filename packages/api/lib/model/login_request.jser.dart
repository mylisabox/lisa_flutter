// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$LoginRequestSerializer implements Serializer<LoginRequest> {
  @override
  Map<String, dynamic> toMap(LoginRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'email', model.email);
    setMapValueIfNotNull(ret, 'password', model.password);
    return ret;
  }

  @override
  LoginRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = new LoginRequest(
        email: map['email'] as String ?? getJserDefault('email'),
        password: map['password'] as String ?? getJserDefault('password'));
    return obj;
  }
}
