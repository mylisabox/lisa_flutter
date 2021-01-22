// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'update_device_info_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdateDeviceInfoRequest> _$updateDeviceInfoRequestSerializer =
    new _$UpdateDeviceInfoRequestSerializer();

class _$UpdateDeviceInfoRequestSerializer
    implements StructuredSerializer<UpdateDeviceInfoRequest> {
  @override
  final Iterable<Type> types = const [
    UpdateDeviceInfoRequest,
    _$UpdateDeviceInfoRequest
  ];
  @override
  final String wireName = 'UpdateDeviceInfoRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, UpdateDeviceInfoRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'roomId',
      serializers.serialize(object.roomId, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UpdateDeviceInfoRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpdateDeviceInfoRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'roomId':
          result.roomId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UpdateDeviceInfoRequest extends UpdateDeviceInfoRequest {
  @override
  final String name;
  @override
  final int roomId;

  factory _$UpdateDeviceInfoRequest(
          [void Function(UpdateDeviceInfoRequestBuilder) updates]) =>
      (new UpdateDeviceInfoRequestBuilder()..update(updates)).build();

  _$UpdateDeviceInfoRequest._({this.name, this.roomId}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('UpdateDeviceInfoRequest', 'name');
    }
    if (roomId == null) {
      throw new BuiltValueNullFieldError('UpdateDeviceInfoRequest', 'roomId');
    }
  }

  @override
  UpdateDeviceInfoRequest rebuild(
          void Function(UpdateDeviceInfoRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateDeviceInfoRequestBuilder toBuilder() =>
      new UpdateDeviceInfoRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateDeviceInfoRequest &&
        name == other.name &&
        roomId == other.roomId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), roomId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateDeviceInfoRequest')
          ..add('name', name)
          ..add('roomId', roomId))
        .toString();
  }
}

class UpdateDeviceInfoRequestBuilder
    implements
        Builder<UpdateDeviceInfoRequest, UpdateDeviceInfoRequestBuilder> {
  _$UpdateDeviceInfoRequest _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _roomId;
  int get roomId => _$this._roomId;
  set roomId(int roomId) => _$this._roomId = roomId;

  UpdateDeviceInfoRequestBuilder() {
    UpdateDeviceInfoRequest._initializeBuilder(this);
  }

  UpdateDeviceInfoRequestBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _roomId = _$v.roomId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateDeviceInfoRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateDeviceInfoRequest;
  }

  @override
  void update(void Function(UpdateDeviceInfoRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateDeviceInfoRequest build() {
    final _$result =
        _$v ?? new _$UpdateDeviceInfoRequest._(name: name, roomId: roomId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
