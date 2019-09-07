// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserSerializer implements Serializer<User> {
  @override
  Map<String, dynamic> toMap(User model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'id', model.id);
    setMapValueIfNotNull(ret, 'email', model.email);
    setMapValueIfNotNull(ret, 'firstname', model.firstname);
    setMapValueIfNotNull(ret, 'lang', model.lang);
    setMapValueIfNotNull(ret, 'lastname', model.lastname);
    setMapValueIfNotNull(ret, 'mobile', model.mobile);
    setMapValueIfNotNull(ret, 'avatar', model.avatar);
    return ret;
  }

  @override
  User fromMap(Map map) {
    if (map == null) return null;
    final obj = User(
        id: map['id'] as int ?? getJserDefault('id'),
        email: map['email'] as String ?? getJserDefault('email'),
        firstname: map['firstname'] as String ?? getJserDefault('firstname'),
        lang: map['lang'] as String ?? getJserDefault('lang'),
        lastname: map['lastname'] as String ?? getJserDefault('lastname'),
        mobile: map['mobile'] as String ?? getJserDefault('mobile'),
        avatar: map['avatar'] as String ?? getJserDefault('avatar'));
    return obj;
  }
}
