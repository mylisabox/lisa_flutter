//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'interact_request.g.dart';



abstract class InteractRequest implements Built<InteractRequest, InteractRequestBuilder> {
    @BuiltValueField(wireName: r'sentence')
    String get sentence;

    @BuiltValueField(wireName: r'lang')
    String? get lang;

    @BuiltValueField(wireName: r'context')
    BuiltMap<String, JsonObject>? get context;

    InteractRequest._();

    static void _initializeBuilder(InteractRequestBuilder b) => b;

    factory InteractRequest([void updates(InteractRequestBuilder b)]) = _$InteractRequest;

    @BuiltValueSerializer(custom: true)
    static Serializer<InteractRequest> get serializer => _$InteractRequestSerializer();
}

class _$InteractRequestSerializer implements StructuredSerializer<InteractRequest> {
    @override
    final Iterable<Type> types = const [InteractRequest, _$InteractRequest];

    @override
    final String wireName = r'InteractRequest';

    @override
    Iterable<Object?> serialize(Serializers serializers, InteractRequest object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'sentence')
            ..add(serializers.serialize(object.sentence,
                specifiedType: const FullType(String)));
        if (object.lang != null) {
            result
                ..add(r'lang')
                ..add(serializers.serialize(object.lang,
                    specifiedType: const FullType(String)));
        }
        if (object.context != null) {
            result
                ..add(r'context')
                ..add(serializers.serialize(object.context,
                    specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
        }
        return result;
    }

    @override
    InteractRequest deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = InteractRequestBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'sentence':
                    result.sentence = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'lang':
                    result.lang = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'context':
                    result.context.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])) as BuiltMap<String, JsonObject>);
                    break;
            }
        }
        return result.build();
    }
}

