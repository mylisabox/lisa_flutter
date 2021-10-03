//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'refresh_token_request.g.dart';

/// RefreshTokenRequest
///
/// Properties:
/// * [refreshToken] 
abstract class RefreshTokenRequest implements Built<RefreshTokenRequest, RefreshTokenRequestBuilder> {
    @BuiltValueField(wireName: r'refreshToken')
    String? get refreshToken;

    RefreshTokenRequest._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(RefreshTokenRequestBuilder b) => b;

    factory RefreshTokenRequest([void updates(RefreshTokenRequestBuilder b)]) = _$RefreshTokenRequest;

    @BuiltValueSerializer(custom: true)
    static Serializer<RefreshTokenRequest> get serializer => _$RefreshTokenRequestSerializer();
}

class _$RefreshTokenRequestSerializer implements StructuredSerializer<RefreshTokenRequest> {
    @override
    final Iterable<Type> types = const [RefreshTokenRequest, _$RefreshTokenRequest];

    @override
    final String wireName = r'RefreshTokenRequest';

    @override
    Iterable<Object?> serialize(Serializers serializers, RefreshTokenRequest object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.refreshToken != null) {
            result
                ..add(r'refreshToken')
                ..add(serializers.serialize(object.refreshToken,
                    specifiedType: const FullType(String)));
        }
        return result;
    }

    @override
    RefreshTokenRequest deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = RefreshTokenRequestBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'refreshToken':
                    result.refreshToken = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
            }
        }
        return result.build();
    }
}

