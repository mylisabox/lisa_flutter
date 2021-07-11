//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'scene_data.g.dart';



abstract class SceneData implements Built<SceneData, SceneDataBuilder> {
    @BuiltValueField(wireName: r'sentences')
    BuiltList<String> get sentences;

    @BuiltValueField(wireName: r'responses')
    BuiltList<String> get responses;

    @BuiltValueField(wireName: r'commands')
    BuiltList<String> get commands;

    SceneData._();

    static void _initializeBuilder(SceneDataBuilder b) => b;

    factory SceneData([void updates(SceneDataBuilder b)]) = _$SceneData;

    @BuiltValueSerializer(custom: true)
    static Serializer<SceneData> get serializer => _$SceneDataSerializer();
}

class _$SceneDataSerializer implements StructuredSerializer<SceneData> {
    @override
    final Iterable<Type> types = const [SceneData, _$SceneData];

    @override
    final String wireName = r'SceneData';

    @override
    Iterable<Object?> serialize(Serializers serializers, SceneData object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'sentences')
            ..add(serializers.serialize(object.sentences,
                specifiedType: const FullType(BuiltList, [FullType(String)])));
        result
            ..add(r'responses')
            ..add(serializers.serialize(object.responses,
                specifiedType: const FullType(BuiltList, [FullType(String)])));
        result
            ..add(r'commands')
            ..add(serializers.serialize(object.commands,
                specifiedType: const FullType(BuiltList, [FullType(String)])));
        return result;
    }

    @override
    SceneData deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = SceneDataBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'sentences':
                    result.sentences.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(String)])) as BuiltList<String>);
                    break;
                case r'responses':
                    result.responses.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(String)])) as BuiltList<String>);
                    break;
                case r'commands':
                    result.commands.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(String)])) as BuiltList<String>);
                    break;
            }
        }
        return result.build();
    }
}

