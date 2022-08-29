//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interact_response.g.dart';

/// InteractResponse
///
/// Properties:
/// * [action] 
/// * [lang] 
/// * [userId] 
/// * [userSentence] 
/// * [response] 
/// * [responses] 
abstract class InteractResponse implements Built<InteractResponse, InteractResponseBuilder> {
    @BuiltValueField(wireName: r'action')
    String get action;

    @BuiltValueField(wireName: r'lang')
    String get lang;

    @BuiltValueField(wireName: r'userId')
    int get userId;

    @BuiltValueField(wireName: r'userSentence')
    String get userSentence;

    @BuiltValueField(wireName: r'response')
    String get response;

    @BuiltValueField(wireName: r'responses')
    BuiltList<String> get responses;

    InteractResponse._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(InteractResponseBuilder b) => b;

    factory InteractResponse([void updates(InteractResponseBuilder b)]) = _$InteractResponse;

    @BuiltValueSerializer(custom: true)
    static Serializer<InteractResponse> get serializer => _$InteractResponseSerializer();
}

class _$InteractResponseSerializer implements StructuredSerializer<InteractResponse> {
    @override
    final Iterable<Type> types = const [InteractResponse, _$InteractResponse];

    @override
    final String wireName = r'InteractResponse';

    @override
    Iterable<Object?> serialize(Serializers serializers, InteractResponse object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'action')
            ..add(serializers.serialize(object.action,
                specifiedType: const FullType(String)));
        result
            ..add(r'lang')
            ..add(serializers.serialize(object.lang,
                specifiedType: const FullType(String)));
        result
            ..add(r'userId')
            ..add(serializers.serialize(object.userId,
                specifiedType: const FullType(int)));
        result
            ..add(r'userSentence')
            ..add(serializers.serialize(object.userSentence,
                specifiedType: const FullType(String)));
        result
            ..add(r'response')
            ..add(serializers.serialize(object.response,
                specifiedType: const FullType(String)));
        result
            ..add(r'responses')
            ..add(serializers.serialize(object.responses,
                specifiedType: const FullType(BuiltList, [FullType(String)])));
        return result;
    }

    @override
    InteractResponse deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = InteractResponseBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'action':
                    result.action = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'lang':
                    result.lang = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'userId':
                    result.userId = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'userSentence':
                    result.userSentence = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'response':
                    result.response = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'responses':
                    result.responses.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(String)])) as BuiltList<String>);
                    break;
            }
        }
        return result.build();
    }
}

