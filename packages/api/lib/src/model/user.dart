//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';



abstract class User implements Built<User, UserBuilder> {
    @BuiltValueField(wireName: r'id')
    int get id;

    @BuiltValueField(wireName: r'email')
    String get email;

    @BuiltValueField(wireName: r'firstname')
    String? get firstname;

    @BuiltValueField(wireName: r'lang')
    String get lang;

    @BuiltValueField(wireName: r'lastname')
    String? get lastname;

    @BuiltValueField(wireName: r'mobile')
    String? get mobile;

    @BuiltValueField(wireName: r'avatar')
    String? get avatar;

    User._();

    static void _initializeBuilder(UserBuilder b) => b;

    factory User([void updates(UserBuilder b)]) = _$User;

    @BuiltValueSerializer(custom: true)
    static Serializer<User> get serializer => _$UserSerializer();
}

class _$UserSerializer implements StructuredSerializer<User> {
    @override
    final Iterable<Type> types = const [User, _$User];

    @override
    final String wireName = r'User';

    @override
    Iterable<Object?> serialize(Serializers serializers, User object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(serializers.serialize(object.id,
                specifiedType: const FullType(int)));
        result
            ..add(r'email')
            ..add(serializers.serialize(object.email,
                specifiedType: const FullType(String)));
        if (object.firstname != null) {
            result
                ..add(r'firstname')
                ..add(serializers.serialize(object.firstname,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'lang')
            ..add(serializers.serialize(object.lang,
                specifiedType: const FullType(String)));
        if (object.lastname != null) {
            result
                ..add(r'lastname')
                ..add(serializers.serialize(object.lastname,
                    specifiedType: const FullType(String)));
        }
        if (object.mobile != null) {
            result
                ..add(r'mobile')
                ..add(serializers.serialize(object.mobile,
                    specifiedType: const FullType(String)));
        }
        if (object.avatar != null) {
            result
                ..add(r'avatar')
                ..add(serializers.serialize(object.avatar,
                    specifiedType: const FullType(String)));
        }
        return result;
    }

    @override
    User deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UserBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'id':
                    result.id = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'email':
                    result.email = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'firstname':
                    result.firstname = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'lang':
                    result.lang = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'lastname':
                    result.lastname = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'mobile':
                    result.mobile = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'avatar':
                    result.avatar = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
            }
        }
        return result.build();
    }
}

