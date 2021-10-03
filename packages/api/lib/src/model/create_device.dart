//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:lisa_server_sdk/src/model/device_type_enum.dart';

part 'create_device.g.dart';

/// CreateDevice
///
/// Properties:
/// * [roomId]
/// * [name]
/// * [driver]
/// * [pluginName]
/// * [type]
/// * [template]
/// * [data]
abstract class CreateDevice implements Built<CreateDevice, CreateDeviceBuilder> {
    @BuiltValueField(wireName: r'roomId')
    int? get roomId;

    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'driver')
    String? get driver;

    @BuiltValueField(wireName: r'pluginName')
    String get pluginName;

    @BuiltValueField(wireName: r'type')
    DeviceTypeEnum get type;
    // enum typeEnum {  light,  webcam,  thermostat,  shutter,  sensor,  media,  speaker,  other,  };

    @BuiltValueField(wireName: r'template')
    BuiltMap<String, JsonObject>? get template;

    @BuiltValueField(wireName: r'data')
    BuiltMap<String, JsonObject>? get data;

    CreateDevice._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CreateDeviceBuilder b) => b;

    factory CreateDevice([void updates(CreateDeviceBuilder b)]) = _$CreateDevice;

    @BuiltValueSerializer(custom: true)
    static Serializer<CreateDevice> get serializer => _$CreateDeviceSerializer();
}

class _$CreateDeviceSerializer implements StructuredSerializer<CreateDevice> {
    @override
    final Iterable<Type> types = const [CreateDevice, _$CreateDevice];

    @override
    final String wireName = r'CreateDevice';

    @override
    Iterable<Object?> serialize(Serializers serializers, CreateDevice object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.roomId != null) {
            result
                ..add(r'roomId')
                ..add(serializers.serialize(object.roomId,
                    specifiedType: const FullType(int)));
        }
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
        result
            ..add(r'pluginName')
            ..add(serializers.serialize(object.pluginName,
                specifiedType: const FullType(String)));
        result
            ..add(r'type')
            ..add(serializers.serialize(object.type,
                specifiedType: const FullType(DeviceTypeEnum)));
        if (object.template != null) {
            result
                ..add(r'template')
                ..add(serializers.serialize(object.template,
                    specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
        }
        if (object.data != null) {
            result
                ..add(r'data')
                ..add(serializers.serialize(object.data,
                    specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
        }
        return result;
    }

    @override
    CreateDevice deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CreateDeviceBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
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
                        specifiedType: const FullType(DeviceTypeEnum)) as DeviceTypeEnum;
                    break;
                case r'template':
                    result.template.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])) as BuiltMap<String, JsonObject>);
                    break;
                case r'data':
                    result.data.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])) as BuiltMap<String, JsonObject>);
                    break;
            }
        }
        return result.build();
    }
}

