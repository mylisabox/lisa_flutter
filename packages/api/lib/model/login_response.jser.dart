// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$LoginResponseSerializer implements Serializer<LoginResponse> {
  Serializer<User> __userSerializer;
  Serializer<User> get _userSerializer =>
      __userSerializer ??= new UserSerializer();
  @override
  Map<String, dynamic> toMap(LoginResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'token', model.token);
    setMapValueIfNotNull(ret, 'user', _userSerializer.toMap(model.user));
    return ret;
  }

  @override
  LoginResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = new LoginResponse(
        token: map['token'] as String ?? getJserDefault('token'),
        user: _userSerializer.fromMap(map['user'] as Map) ??
            getJserDefault('user'));
    return obj;
  }
}
