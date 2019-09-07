// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserUpdateSerializer implements Serializer<UserUpdate> {
  @override
  Map<String, dynamic> toMap(UserUpdate model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'id', model.id);
    setMapValueIfNotNull(ret, 'email', model.email);
    setMapValueIfNotNull(ret, 'firstname', model.firstname);
    setMapValueIfNotNull(ret, 'lang', model.lang);
    setMapValueIfNotNull(ret, 'lastname', model.lastname);
    setMapValueIfNotNull(ret, 'mobile', model.mobile);
    setMapValueIfNotNull(ret, 'password', model.password);
    setMapValueIfNotNull(ret, 'avatar',
        codeNonNullIterable(model.avatar, (val) => val as int, []));
    return ret;
  }

  @override
  UserUpdate fromMap(Map map) {
    if (map == null) return null;
    final obj = UserUpdate(
        id: map['id'] as int ?? getJserDefault('id'),
        email: map['email'] as String ?? getJserDefault('email'),
        firstname: map['firstname'] as String ?? getJserDefault('firstname'),
        lang: map['lang'] as String ?? getJserDefault('lang'),
        lastname: map['lastname'] as String ?? getJserDefault('lastname'),
        mobile: map['mobile'] as String ?? getJserDefault('mobile'),
        password: map['password'] as String ?? getJserDefault('password'),
        avatar: codeNonNullIterable<int>(
                map['avatar'] as Iterable, (val) => val as int, <int>[]) ??
            getJserDefault('avatar'));
    return obj;
  }
}
