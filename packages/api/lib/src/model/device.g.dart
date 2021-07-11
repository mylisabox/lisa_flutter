// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Device extends Device {
  @override
  final int id;
  @override
  final int roomId;
  @override
  final String name;
  @override
  final String? driver;
  @override
  final String? pluginName;
  @override
  final String type;
  @override
  final BuiltMap<String, JsonObject> template;
  @override
  final BuiltMap<String, JsonObject>? data;
  @override
  final bool favorite;

  factory _$Device([void Function(DeviceBuilder)? updates]) =>
      (new DeviceBuilder()..update(updates)).build();

  _$Device._(
      {required this.id,
      required this.roomId,
      required this.name,
      this.driver,
      this.pluginName,
      required this.type,
      required this.template,
      this.data,
      required this.favorite})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Device', 'id');
    BuiltValueNullFieldError.checkNotNull(roomId, 'Device', 'roomId');
    BuiltValueNullFieldError.checkNotNull(name, 'Device', 'name');
    BuiltValueNullFieldError.checkNotNull(type, 'Device', 'type');
    BuiltValueNullFieldError.checkNotNull(template, 'Device', 'template');
    BuiltValueNullFieldError.checkNotNull(favorite, 'Device', 'favorite');
  }

  @override
  Device rebuild(void Function(DeviceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceBuilder toBuilder() => new DeviceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Device &&
        id == other.id &&
        roomId == other.roomId &&
        name == other.name &&
        driver == other.driver &&
        pluginName == other.pluginName &&
        type == other.type &&
        template == other.template &&
        data == other.data &&
        favorite == other.favorite;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), roomId.hashCode),
                                name.hashCode),
                            driver.hashCode),
                        pluginName.hashCode),
                    type.hashCode),
                template.hashCode),
            data.hashCode),
        favorite.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Device')
          ..add('id', id)
          ..add('roomId', roomId)
          ..add('name', name)
          ..add('driver', driver)
          ..add('pluginName', pluginName)
          ..add('type', type)
          ..add('template', template)
          ..add('data', data)
          ..add('favorite', favorite))
        .toString();
  }
}

class DeviceBuilder implements Builder<Device, DeviceBuilder> {
  _$Device? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

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

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  MapBuilder<String, JsonObject>? _template;
  MapBuilder<String, JsonObject> get template =>
      _$this._template ??= new MapBuilder<String, JsonObject>();
  set template(MapBuilder<String, JsonObject>? template) =>
      _$this._template = template;

  MapBuilder<String, JsonObject>? _data;
  MapBuilder<String, JsonObject> get data =>
      _$this._data ??= new MapBuilder<String, JsonObject>();
  set data(MapBuilder<String, JsonObject>? data) => _$this._data = data;

  bool? _favorite;
  bool? get favorite => _$this._favorite;
  set favorite(bool? favorite) => _$this._favorite = favorite;

  DeviceBuilder() {
    Device._initializeBuilder(this);
  }

  DeviceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _roomId = $v.roomId;
      _name = $v.name;
      _driver = $v.driver;
      _pluginName = $v.pluginName;
      _type = $v.type;
      _template = $v.template.toBuilder();
      _data = $v.data?.toBuilder();
      _favorite = $v.favorite;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Device other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Device;
  }

  @override
  void update(void Function(DeviceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Device build() {
    _$Device _$result;
    try {
      _$result = _$v ??
          new _$Device._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Device', 'id'),
              roomId: BuiltValueNullFieldError.checkNotNull(
                  roomId, 'Device', 'roomId'),
              name:
                  BuiltValueNullFieldError.checkNotNull(name, 'Device', 'name'),
              driver: driver,
              pluginName: pluginName,
              type:
                  BuiltValueNullFieldError.checkNotNull(type, 'Device', 'type'),
              template: template.build(),
              data: _data?.build(),
              favorite: BuiltValueNullFieldError.checkNotNull(
                  favorite, 'Device', 'favorite'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'template';
        template.build();
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Device', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
