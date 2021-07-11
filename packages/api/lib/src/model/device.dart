//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'device.g.dart';



abstract class Device implements Built<Device, DeviceBuilder> {
    @BuiltValueField(wireName: r'id')
    int get id;

    @BuiltValueField(wireName: r'roomId')
    int get roomId;

    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'driver')
    String? get driver;

    @BuiltValueField(wireName: r'pluginName')
    String? get pluginName;

    @BuiltValueField(wireName: r'type')
    String get type;

    @BuiltValueField(wireName: r'template')
    BuiltMap<String, JsonObject> get template;

    @BuiltValueField(wireName: r'data')
    BuiltMap<String, JsonObject>? get data;

    @BuiltValueField(wireName: r'favorite')
    bool get favorite;

    Device._();

    static void _initializeBuilder(DeviceBuilder b) => b
        ..favorite = false;

    factory Device([void updates(DeviceBuilder b)]) = _$Device;

    @BuiltValueSerializer(custom: true)
    static Serializer<Device> get serializer => _$DeviceSerializer();
}

class _$DeviceSerializer implements StructuredSerializer<Device> {
    @override
    final Iterable<Type> types = const [Device, _$Device];

    @override
    final String wireName = r'Device';

    @override
    Iterable<Object?> serialize(Serializers serializers, Device object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(serializers.serialize(object.id,
                specifiedType: const FullType(int)));
        result
            ..add(r'roomId')
            ..add(serializers.serialize(object.roomId,
                specifiedType: const FullType(int)));
        result
            ..add(r'name')
            ..add(serializers.serialize(object.name,
                specifiedType: const FullType(String)));
        if (object.driver != null) {
            result
                ..add(r'driver')
                ..add(serializers.serialize(object.driver,
                    specifiedType: const FullType(String)));
        }
        if (object.pluginName != null) {
            result
                ..add(r'pluginName')
                ..add(serializers.serialize(object.pluginName,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'type')
            ..add(serializers.serialize(object.type,
                specifiedType: const FullType(String)));
        result
            ..add(r'template')
            ..add(serializers.serialize(object.template,
                specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
        if (object.data != null) {
            result
                ..add(r'data')
                ..add(serializers.serialize(object.data,
                    specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
        }
        result
            ..add(r'favorite')
            ..add(serializers.serialize(object.favorite,
                specifiedType: const FullType(bool)));
        return result;
    }

    @override
    Device deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = DeviceBuilder();

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
                case r'roomId':
                    result.roomId = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'name':
                    result.name = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'driver':
                    result.driver = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'pluginName':
                    result.pluginName = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'type':
                    result.type = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'template':
                    result.template.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])) as BuiltMap<String, JsonObject>);
                    break;
                case r'data':
                    result.data.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])) as BuiltMap<String, JsonObject>);
                    break;
                case r'favorite':
                    result.favorite = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
            }
        }
        return result.build();
    }
}

