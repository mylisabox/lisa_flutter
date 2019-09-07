// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_device_name_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UpdateDeviceNameRequestSerializer
    implements Serializer<UpdateDeviceNameRequest> {
  @override
  Map<String, dynamic> toMap(UpdateDeviceNameRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'name', model.name);
    return ret;
  }

  @override
  UpdateDeviceNameRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = UpdateDeviceNameRequest(
        name: map['name'] as String ?? getJserDefault('name'));
    return obj;
  }
}
