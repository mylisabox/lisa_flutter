//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'room.g.dart';



abstract class Room implements Built<Room, RoomBuilder> {
    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'name')
    String get name;

    Room._();

    static void _initializeBuilder(RoomBuilder b) => b;

    factory Room([void updates(RoomBuilder b)]) = _$Room;

    @BuiltValueSerializer(custom: true)
    static Serializer<Room> get serializer => _$RoomSerializer();
}

class _$RoomSerializer implements StructuredSerializer<Room> {
    @override
    final Iterable<Type> types = const [Room, _$Room];

    @override
    final String wireName = r'Room';

    @override
    Iterable<Object?> serialize(Serializers serializers, Room object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(object.id == null ? null : serializers.serialize(object.id,
                specifiedType: const FullType(int)));
        result
            ..add(r'name')
            ..add(serializers.serialize(object.name,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    Room deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = RoomBuilder();

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
                case r'name':
                    result.name = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
            }
        }
        return result.build();
    }
}

