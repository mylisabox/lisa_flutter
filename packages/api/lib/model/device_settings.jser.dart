// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_settings.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$DeviceSettingsSerializer
    implements Serializer<DeviceSettings> {
  @override
  Map<String, dynamic> toMap(DeviceSettings model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'name', model.name);
    setMapValueIfNotNull(ret, 'driver', model.driver);
    setMapValueIfNotNull(ret, 'image', model.image);
    setMapValueIfNotNull(ret, 'pairing', model.pairing);
    setMapValueIfNotNull(ret, 'pluginName', model.pluginName);
    setMapValueIfNotNull(ret, 'description', model.description);
    setMapValueIfNotNull(ret, 'type', model.type);
    setMapValueIfNotNull(
        ret,
        'template',
        codeNonNullMap(model.template, (val) => passProcessor.serialize(val),
            <String, dynamic>{}));
    setMapValueIfNotNull(
        ret,
        'settings',
        codeNonNullMap(model.settings, (val) => passProcessor.serialize(val),
            <String, dynamic>{}));
    return ret;
  }

  @override
  DeviceSettings fromMap(Map map) {
    if (map == null) return null;
    final obj = DeviceSettings(
        name: map['name'] as String ?? getJserDefault('name'),
        driver: map['driver'] as String ?? getJserDefault('driver'),
        image: map['image'] as String ?? getJserDefault('image'),
        pairing: map['pairing'] as String ?? getJserDefault('pairing'),
        pluginName: map['pluginName'] as String ?? getJserDefault('pluginName'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        type: map['type'] as String ?? getJserDefault('type'),
        template: codeNonNullMap<Object>(
                map['template'] as Map,
                (val) => passProcessor.deserialize(val) as Object,
                <String, Object>{}) ??
            getJserDefault('template'),
        settings: codeNonNullMap<Object>(
                map['settings'] as Map,
                (val) => passProcessor.deserialize(val) as Object,
                <String, Object>{}) ??
            getJserDefault('settings'));
    return obj;
  }
}
