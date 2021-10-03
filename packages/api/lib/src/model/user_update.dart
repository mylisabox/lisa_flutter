//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_update.g.dart';

/// UserUpdate
///
/// Properties:
/// * [email]
/// * [firstName]
/// * [lang]
/// * [lastName]
/// * [mobile]
/// * [password]
/// * [avatar]
abstract class UserUpdate implements Built<UserUpdate, UserUpdateBuilder> {
    @BuiltValueField(wireName: r'email')
    String? get email;

    @BuiltValueField(wireName: r'firstName')
    String? get firstName;

    @BuiltValueField(wireName: r'lang')
    String? get lang;

    @BuiltValueField(wireName: r'lastName')
    String? get lastName;

    @BuiltValueField(wireName: r'mobile')
    String? get mobile;

    @BuiltValueField(wireName: r'password')
    String? get password;

    @BuiltValueField(wireName: r'avatar')
    Uint8List? get avatar;

    UserUpdate._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(UserUpdateBuilder b) => b;

    factory UserUpdate([void updates(UserUpdateBuilder b)]) = _$UserUpdate;

    @BuiltValueSerializer(custom: true)
    static Serializer<UserUpdate> get serializer => _$UserUpdateSerializer();
}

class _$UserUpdateSerializer implements StructuredSerializer<UserUpdate> {
    @override
    final Iterable<Type> types = const [UserUpdate, _$UserUpdate];

    @override
    final String wireName = r'UserUpdate';

    @override
    Iterable<Object?> serialize(Serializers serializers, UserUpdate object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.email != null) {
            result
                ..add(r'email')
                ..add(serializers.serialize(object.email,
                    specifiedType: const FullType(String)));
        }
        if (object.firstName != null) {
            result
                ..add(r'firstName')
                ..add(serializers.serialize(object.firstName,
                    specifiedType: const FullType(String)));
        }
        if (object.lang != null) {
            result
                ..add(r'lang')
                ..add(serializers.serialize(object.lang,
                    specifiedType: const FullType(String)));
        }
        if (object.lastName != null) {
            result
                ..add(r'lastName')
                ..add(serializers.serialize(object.lastName,
                    specifiedType: const FullType(String)));
        }
        if (object.mobile != null) {
            result
                ..add(r'mobile')
                ..add(serializers.serialize(object.mobile,
                    specifiedType: const FullType(String)));
        }
        if (object.password != null) {
            result
                ..add(r'password')
                ..add(serializers.serialize(object.password,
                    specifiedType: const FullType(String)));
        }
        if (object.avatar != null) {
            result
                ..add(r'avatar')
                ..add(serializers.serialize(object.avatar,
                    specifiedType: const FullType(Uint8List)));
        }
        return result;
    }

    @override
    UserUpdate deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UserUpdateBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'email':
                    result.email = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'firstName':
                    result.firstName = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'lang':
                    result.lang = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'lastName':
                    result.lastName = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'mobile':
                    result.mobile = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'password':
                    result.password = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'avatar':
                    result.avatar = serializers.deserialize(value,
                        specifiedType: const FullType(Uint8List)) as Uint8List;
                    break;
            }
        }
        return result.build();
    }
}

