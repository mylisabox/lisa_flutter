// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_device_info_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateDeviceInfoRequest extends UpdateDeviceInfoRequest {
  @override
  final String name;
  @override
  final int? roomId;

  factory _$UpdateDeviceInfoRequest(
          [void Function(UpdateDeviceInfoRequestBuilder)? updates]) =>
      (new UpdateDeviceInfoRequestBuilder()..update(updates)).build();

  _$UpdateDeviceInfoRequest._({required this.name, this.roomId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, 'UpdateDeviceInfoRequest', 'name');
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
  _$UpdateDeviceInfoRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _roomId;
  int? get roomId => _$this._roomId;
  set roomId(int? roomId) => _$this._roomId = roomId;

  UpdateDeviceInfoRequestBuilder() {
    UpdateDeviceInfoRequest._defaults(this);
  }

  UpdateDeviceInfoRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _roomId = $v.roomId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateDeviceInfoRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateDeviceInfoRequest;
  }

  @override
  void update(void Function(UpdateDeviceInfoRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateDeviceInfoRequest build() {
    final _$result = _$v ??
        new _$UpdateDeviceInfoRequest._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'UpdateDeviceInfoRequest', 'name'),
            roomId: roomId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
