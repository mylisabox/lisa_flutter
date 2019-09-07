// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_device.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PairingDeviceSerializer implements Serializer<PairingDevice> {
  @override
  Map<String, dynamic> toMap(PairingDevice model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'name', model.name);
    setMapValueIfNotNull(ret, 'image', model.image);
    setMapValueIfNotNull(ret, 'id', model.id);
    return ret;
  }

  @override
  PairingDevice fromMap(Map map) {
    if (map == null) return null;
    final obj = PairingDevice(
        name: map['name'] as String ?? getJserDefault('name'),
        image: map['image'] as String ?? getJserDefault('image'),
        id: map['id'] as String ?? getJserDefault('id'));
    return obj;
  }
}
