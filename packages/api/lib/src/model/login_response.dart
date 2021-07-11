//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lisa_server_sdk/src/model/user.dart';

part 'login_response.g.dart';



abstract class LoginResponse implements Built<LoginResponse, LoginResponseBuilder> {
    @BuiltValueField(wireName: r'token')
    String get token;

    @BuiltValueField(wireName: r'user')
    User get user;

    LoginResponse._();

    static void _initializeBuilder(LoginResponseBuilder b) => b;

    factory LoginResponse([void updates(LoginResponseBuilder b)]) = _$LoginResponse;

    @BuiltValueSerializer(custom: true)
    static Serializer<LoginResponse> get serializer => _$LoginResponseSerializer();
}

class _$LoginResponseSerializer implements StructuredSerializer<LoginResponse> {
    @override
    final Iterable<Type> types = const [LoginResponse, _$LoginResponse];

    @override
    final String wireName = r'LoginResponse';

    @override
    Iterable<Object?> serialize(Serializers serializers, LoginResponse object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'token')
            ..add(serializers.serialize(object.token,
                specifiedType: const FullType(String)));
        result
            ..add(r'user')
            ..add(serializers.serialize(object.user,
                specifiedType: const FullType(User)));
        return result;
    }

    @override
    LoginResponse deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = LoginResponseBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'token':
                    result.token = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'user':
                    result.user.replace(serializers.deserialize(value,
                        specifiedType: const FullType(User)) as User);
                    break;
            }
        }
        return result.build();
    }
}

