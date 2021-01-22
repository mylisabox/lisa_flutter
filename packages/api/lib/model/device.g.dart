// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'device.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Device> _$deviceSerializer = new _$DeviceSerializer();

class _$DeviceSerializer implements StructuredSerializer<Device> {
  @override
  final Iterable<Type> types = const [Device, _$Device];
  @override
  final String wireName = 'Device';

  @override
  Iterable<Object> serialize(Serializers serializers, Device object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'roomId',
      serializers.serialize(object.roomId, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'template',
      serializers.serialize(object.template,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)])),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)])),
      'favorite',
      serializers.serialize(object.favorite,
          specifiedType: const FullType(bool)),
    ];
    if (object.driver != null) {
      result
        ..add('driver')
        ..add(serializers.serialize(object.driver,
            specifiedType: const FullType(String)));
    }
    if (object.pluginName != null) {
      result
        ..add('pluginName')
        ..add(serializers.serialize(object.pluginName,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Device deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeviceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'roomId':
          result.roomId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'driver':
          result.driver = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pluginName':
          result.pluginName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'template':
          result.template.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(JsonObject)])));
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(JsonObject)])));
          break;
        case 'favorite':
          result.favorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Device extends Device {
  @override
  final int id;
  @override
  final int roomId;
  @override
  final String name;
  @override
  final String driver;
  @override
  final String pluginName;
  @override
  final String type;
  @override
  final BuiltMap<String, JsonObject> template;
  @override
  final BuiltMap<String, JsonObject> data;
  @override
  final bool favorite;

  factory _$Device([void Function(DeviceBuilder) updates]) =>
      (new DeviceBuilder()..update(updates)).build();

  _$Device._(
      {this.id,
      this.roomId,
      this.name,
      this.driver,
      this.pluginName,
      this.type,
      this.template,
      this.data,
      this.favorite})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Device', 'id');
    }
    if (roomId == null) {
      throw new BuiltValueNullFieldError('Device', 'roomId');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Device', 'name');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Device', 'type');
    }
    if (template == null) {
      throw new BuiltValueNullFieldError('Device', 'template');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('Device', 'data');
    }
    if (favorite == null) {
      throw new BuiltValueNullFieldError('Device', 'favorite');
    }
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
  _$Device _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _roomId;
  int get roomId => _$this._roomId;
  set roomId(int roomId) => _$this._roomId = roomId;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _driver;
  String get driver => _$this._driver;
  set driver(String driver) => _$this._driver = driver;

  String _pluginName;
  String get pluginName => _$this._pluginName;
  set pluginName(String pluginName) => _$this._pluginName = pluginName;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  MapBuilder<String, JsonObject> _template;
  MapBuilder<String, JsonObject> get template =>
      _$this._template ??= new MapBuilder<String, JsonObject>();
  set template(MapBuilder<String, JsonObject> template) =>
      _$this._template = template;

  MapBuilder<String, JsonObject> _data;
  MapBuilder<String, JsonObject> get data =>
      _$this._data ??= new MapBuilder<String, JsonObject>();
  set data(MapBuilder<String, JsonObject> data) => _$this._data = data;

  bool _favorite;
  bool get favorite => _$this._favorite;
  set favorite(bool favorite) => _$this._favorite = favorite;

  DeviceBuilder() {
    Device._initializeBuilder(this);
  }

  DeviceBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _roomId = _$v.roomId;
      _name = _$v.name;
      _driver = _$v.driver;
      _pluginName = _$v.pluginName;
      _type = _$v.type;
      _template = _$v.template?.toBuilder();
      _data = _$v.data?.toBuilder();
      _favorite = _$v.favorite;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Device other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Device;
  }

  @override
  void update(void Function(DeviceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Device build() {
    _$Device _$result;
    try {
      _$result = _$v ??
          new _$Device._(
              id: id,
              roomId: roomId,
              name: name,
              driver: driver,
              pluginName: pluginName,
              type: type,
              template: template.build(),
              data: data.build(),
              favorite: favorite);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'template';
        template.build();
        _$failedField = 'data';
        data.build();
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
