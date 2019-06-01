// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$DeviceSerializer implements Serializer<Device> {
  @override
  Map<String, dynamic> toMap(Device model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'id', model.id);
    setMapValueIfNotNull(ret, 'roomId', model.roomId);
    setMapValueIfNotNull(ret, 'name', model.name);
    setMapValueIfNotNull(ret, 'driver', model.driver);
    setMapValueIfNotNull(ret, 'pluginName', model.pluginName);
    setMapValueIfNotNull(ret, 'type', model.type);
    setMapValueIfNotNull(
        ret,
        'template',
        codeNonNullMap(model.template, (val) => passProcessor.serialize(val),
            <String, dynamic>{}));
    setMapValueIfNotNull(
        ret,
        'data',
        codeNonNullMap(model.data, (val) => passProcessor.serialize(val),
            <String, dynamic>{}));
    setMapValueIfNotNull(ret, 'favorite', model.favorite);
    return ret;
  }

  @override
  Device fromMap(Map map) {
    if (map == null) return null;
    final obj = new Device(
        id: map['id'] as int ?? getJserDefault('id'),
        roomId: map['roomId'] as int ?? getJserDefault('roomId'),
        name: map['name'] as String ?? getJserDefault('name'),
        driver: map['driver'] as String ?? getJserDefault('driver'),
        pluginName: map['pluginName'] as String ?? getJserDefault('pluginName'),
        type: map['type'] as String ?? getJserDefault('type'),
        template: codeNonNullMap<Object>(
                map['template'] as Map,
                (val) => passProcessor.deserialize(val) as Object,
                <String, Object>{}) ??
            getJserDefault('template'),
        data: codeNonNullMap<Object>(
                map['data'] as Map,
                (val) => passProcessor.deserialize(val) as Object,
                <String, Object>{}) ??
            getJserDefault('data'),
        favorite: map['favorite'] as bool ?? getJserDefault('favorite'));
    return obj;
  }
}
