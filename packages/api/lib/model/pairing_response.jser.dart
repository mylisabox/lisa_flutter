// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PairingResponseSerializer
    implements Serializer<PairingResponse> {
  Serializer<PairingDevice> __pairingDeviceSerializer;
  Serializer<PairingDevice> get _pairingDeviceSerializer =>
      __pairingDeviceSerializer ??= new PairingDeviceSerializer();
  @override
  Map<String, dynamic> toMap(PairingResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'singleChoice', model.singleChoice);
    setMapValueIfNotNull(
        ret, 'devices', _pairingDeviceSerializer.toMap(model.devices));
    setMapValueIfNotNull(ret, 'step', model.step);
    return ret;
  }

  @override
  PairingResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = new PairingResponse(
        singleChoice:
            map['singleChoice'] as bool ?? getJserDefault('singleChoice'),
        devices: _pairingDeviceSerializer.fromMap(map['devices'] as Map) ??
            getJserDefault('devices'),
        step: map['step'] as String ?? getJserDefault('step'));
    return obj;
  }
}
