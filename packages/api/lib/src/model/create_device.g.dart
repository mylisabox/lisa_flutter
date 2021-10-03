// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_device.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateDevice extends CreateDevice {
  @override
  final int? roomId;
  @override
  final String name;
  @override
  final String? driver;
  @override
  final String pluginName;
  @override
  final DeviceTypeEnum type;
  @override
  final BuiltMap<String, JsonObject>? template;
  @override
  final BuiltMap<String, JsonObject>? data;

  factory _$CreateDevice([void Function(CreateDeviceBuilder)? updates]) =>
      (new CreateDeviceBuilder()..update(updates)).build();

  _$CreateDevice._(
      {this.roomId,
      required this.name,
      this.driver,
      required this.pluginName,
      required this.type,
      this.template,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'CreateDevice', 'name');
    BuiltValueNullFieldError.checkNotNull(
        pluginName, 'CreateDevice', 'pluginName');
    BuiltValueNullFieldError.checkNotNull(type, 'CreateDevice', 'type');
  }

  @override
  CreateDevice rebuild(void Function(CreateDeviceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateDeviceBuilder toBuilder() => new CreateDeviceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateDevice &&
        roomId == other.roomId &&
        name == other.name &&
        driver == other.driver &&
        pluginName == other.pluginName &&
        type == other.type &&
        template == other.template &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, roomId.hashCode), name.hashCode),
                        driver.hashCode),
                    pluginName.hashCode),
                type.hashCode),
            template.hashCode),
        data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreateDevice')
          ..add('roomId', roomId)
          ..add('name', name)
          ..add('driver', driver)
          ..add('pluginName', pluginName)
          ..add('type', type)
          ..add('template', template)
          ..add('data', data))
        .toString();
  }
}

class CreateDeviceBuilder
    implements Builder<CreateDevice, CreateDeviceBuilder> {
  _$CreateDevice? _$v;

  int? _roomId;
  int? get roomId => _$this._roomId;
  set roomId(int? roomId) => _$this._roomId = roomId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _driver;
  String? get driver => _$this._driver;
  set driver(String? driver) => _$this._driver = driver;

  String? _pluginName;
  String? get pluginName => _$this._pluginName;
  set pluginName(String? pluginName) => _$this._pluginName = pluginName;

  DeviceTypeEnum? _type;
  DeviceTypeEnum? get type => _$this._type;
  set type(DeviceTypeEnum? type) => _$this._type = type;

  MapBuilder<String, JsonObject>? _template;
  MapBuilder<String, JsonObject> get template =>
      _$this._template ??= new MapBuilder<String, JsonObject>();
  set template(MapBuilder<String, JsonObject>? template) =>
      _$this._template = template;

  MapBuilder<String, JsonObject>? _data;
  MapBuilder<String, JsonObject> get data =>
      _$this._data ??= new MapBuilder<String, JsonObject>();
  set data(MapBuilder<String, JsonObject>? data) => _$this._data = data;

  CreateDeviceBuilder() {
    CreateDevice._defaults(this);
  }

  CreateDeviceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _roomId = $v.roomId;
      _name = $v.name;
      _driver = $v.driver;
      _pluginName = $v.pluginName;
      _type = $v.type;
      _template = $v.template?.toBuilder();
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateDevice other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateDevice;
  }

  @override
  void update(void Function(CreateDeviceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreateDevice build() {
    _$CreateDevice _$result;
    try {
      _$result = _$v ??
          new _$CreateDevice._(
              roomId: roomId,
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'CreateDevice', 'name'),
              driver: driver,
              pluginName: BuiltValueNullFieldError.checkNotNull(
                  pluginName, 'CreateDevice', 'pluginName'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, 'CreateDevice', 'type'),
              template: _template?.build(),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'template';
        _template?.build();
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreateDevice', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
