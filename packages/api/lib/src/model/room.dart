//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lisa_server_sdk/src/model/device.dart';

part 'room.g.dart';

/// Room
///
/// Properties:
/// * [id]
/// * [sortOrder]
/// * [name]
/// * [devices]
abstract class Room implements Built<Room, RoomBuilder> {
    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'sortOrder')
    int get sortOrder;

    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'devices')
    BuiltList<Device> get devices;

    Room._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(RoomBuilder b) => b;

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
            ..add(r'sortOrder')
            ..add(serializers.serialize(object.sortOrder,
                specifiedType: const FullType(int)));
        result
            ..add(r'name')
            ..add(serializers.serialize(object.name,
                specifiedType: const FullType(String)));
        result
            ..add(r'devices')
            ..add(serializers.serialize(object.devices,
                specifiedType: const FullType(BuiltList, [FullType(Device)])));
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
                case r'sortOrder':
                    result.sortOrder = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'name':
                    result.name = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'devices':
                    result.devices.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(Device)])) as BuiltList<Device>);
                    break;
            }
        }
        return result.build();
    }
}

