//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:lisa_server_sdk/src/model/device_type_enum.dart';

part 'device.g.dart';

/// Device
///
/// Properties:
/// * [id]
/// * [roomId]
/// * [grouped]
/// * [groupCount]
/// * [children]
/// * [name]
/// * [defaultAction]
/// * [driver]
/// * [powered]
/// * [imageOn]
/// * [imageOff]
/// * [sortOrder]
/// * [pluginName]
/// * [type]
/// * [template]
/// * [data]
/// * [favorite]
abstract class Device implements Built<Device, DeviceBuilder> {
    @BuiltValueField(wireName: r'id')
    int get id;

    @BuiltValueField(wireName: r'roomId')
    int? get roomId;

    @BuiltValueField(wireName: r'grouped')
    bool? get grouped;

    @BuiltValueField(wireName: r'groupCount')
    int? get groupCount;

    @BuiltValueField(wireName: r'children')
    BuiltList<Device>? get children;

    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'defaultAction')
    String? get defaultAction;

    @BuiltValueField(wireName: r'driver')
    String? get driver;

    @BuiltValueField(wireName: r'powered')
    bool get powered;

    @BuiltValueField(wireName: r'imageOn')
    String? get imageOn;

    @BuiltValueField(wireName: r'imageOff')
    String? get imageOff;

    @BuiltValueField(wireName: r'sortOrder')
    int get sortOrder;

    @BuiltValueField(wireName: r'pluginName')
    String get pluginName;

    @BuiltValueField(wireName: r'type')
    DeviceTypeEnum get type;
    // enum typeEnum {  light,  webcam,  thermostat,  shutter,  sensor,  media,  speaker,  other,  };

    @BuiltValueField(wireName: r'template')
    BuiltMap<String, JsonObject>? get template;

    @BuiltValueField(wireName: r'data')
    BuiltMap<String, JsonObject>? get data;

    @BuiltValueField(wireName: r'favorite')
    bool get favorite;

    Device._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(DeviceBuilder b) => b
        ..grouped = false
        ..groupCount = 0
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
        if (object.roomId != null) {
            result
                ..add(r'roomId')
                ..add(serializers.serialize(object.roomId,
                    specifiedType: const FullType(int)));
        }
        if (object.grouped != null) {
            result
                ..add(r'grouped')
                ..add(serializers.serialize(object.grouped,
                    specifiedType: const FullType(bool)));
        }
        if (object.groupCount != null) {
            result
                ..add(r'groupCount')
                ..add(serializers.serialize(object.groupCount,
                    specifiedType: const FullType(int)));
        }
        if (object.children != null) {
            result
                ..add(r'children')
                ..add(serializers.serialize(object.children,
                    specifiedType: const FullType(BuiltList, [FullType(Device)])));
        }
        result
            ..add(r'name')
            ..add(serializers.serialize(object.name,
                specifiedType: const FullType(String)));
        if (object.defaultAction != null) {
            result
                ..add(r'defaultAction')
                ..add(serializers.serialize(object.defaultAction,
                    specifiedType: const FullType(String)));
        }
        if (object.driver != null) {
            result
                ..add(r'driver')
                ..add(serializers.serialize(object.driver,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'powered')
            ..add(serializers.serialize(object.powered,
                specifiedType: const FullType(bool)));
        if (object.imageOn != null) {
            result
                ..add(r'imageOn')
                ..add(serializers.serialize(object.imageOn,
                    specifiedType: const FullType(String)));
        }
        if (object.imageOff != null) {
            result
                ..add(r'imageOff')
                ..add(serializers.serialize(object.imageOff,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'sortOrder')
            ..add(serializers.serialize(object.sortOrder,
                specifiedType: const FullType(int)));
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
                case r'grouped':
                    result.grouped = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
                case r'groupCount':
                    result.groupCount = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'children':
                    result.children.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(Device)])) as BuiltList<Device>);
                    break;
                case r'name':
                    result.name = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'defaultAction':
                    result.defaultAction = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'driver':
                    result.driver = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'powered':
                    result.powered = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
                case r'imageOn':
                    result.imageOn = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'imageOff':
                    result.imageOff = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'sortOrder':
                    result.sortOrder = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
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
                case r'favorite':
                    result.favorite = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
            }
        }
        return result.build();
    }
}

