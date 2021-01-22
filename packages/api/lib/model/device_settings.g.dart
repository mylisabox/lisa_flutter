// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'device_settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeviceSettings> _$deviceSettingsSerializer =
    new _$DeviceSettingsSerializer();

class _$DeviceSettingsSerializer
    implements StructuredSerializer<DeviceSettings> {
  @override
  final Iterable<Type> types = const [DeviceSettings, _$DeviceSettings];
  @override
  final String wireName = 'DeviceSettings';

  @override
  Iterable<Object> serialize(Serializers serializers, DeviceSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'driver',
      serializers.serialize(object.driver,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'pairing',
      serializers.serialize(object.pairing,
          specifiedType: const FullType(String)),
      'pluginName',
      serializers.serialize(object.pluginName,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'template',
      serializers.serialize(object.template,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(JsonObject)])),
    ];
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.settings != null) {
      result
        ..add('settings')
        ..add(serializers.serialize(object.settings,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(JsonObject)])));
    }
    return result;
  }

  @override
  DeviceSettings deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeviceSettingsBuilder();

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
        case 'driver':
          result.driver = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pairing':
          result.pairing = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pluginName':
          result.pluginName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
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
        case 'settings':
          result.settings.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(JsonObject)])));
          break;
      }
    }

    return result.build();
  }
}

class _$DeviceSettings extends DeviceSettings {
  @override
  final String name;
  @override
  final String driver;
  @override
  final String image;
  @override
  final String pairing;
  @override
  final String pluginName;
  @override
  final String description;
  @override
  final String type;
  @override
  final BuiltMap<String, JsonObject> template;
  @override
  final BuiltMap<String, JsonObject> settings;

  factory _$DeviceSettings([void Function(DeviceSettingsBuilder) updates]) =>
      (new DeviceSettingsBuilder()..update(updates)).build();

  _$DeviceSettings._(
      {this.name,
      this.driver,
      this.image,
      this.pairing,
      this.pluginName,
      this.description,
      this.type,
      this.template,
      this.settings})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('DeviceSettings', 'name');
    }
    if (driver == null) {
      throw new BuiltValueNullFieldError('DeviceSettings', 'driver');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('DeviceSettings', 'image');
    }
    if (pairing == null) {
      throw new BuiltValueNullFieldError('DeviceSettings', 'pairing');
    }
    if (pluginName == null) {
      throw new BuiltValueNullFieldError('DeviceSettings', 'pluginName');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('DeviceSettings', 'description');
    }
    if (template == null) {
      throw new BuiltValueNullFieldError('DeviceSettings', 'template');
    }
  }

  @override
  DeviceSettings rebuild(void Function(DeviceSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceSettingsBuilder toBuilder() =>
      new DeviceSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceSettings &&
        name == other.name &&
        driver == other.driver &&
        image == other.image &&
        pairing == other.pairing &&
        pluginName == other.pluginName &&
        description == other.description &&
        type == other.type &&
        template == other.template &&
        settings == other.settings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, name.hashCode), driver.hashCode),
                                image.hashCode),
                            pairing.hashCode),
                        pluginName.hashCode),
                    description.hashCode),
                type.hashCode),
            template.hashCode),
        settings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeviceSettings')
          ..add('name', name)
          ..add('driver', driver)
          ..add('image', image)
          ..add('pairing', pairing)
          ..add('pluginName', pluginName)
          ..add('description', description)
          ..add('type', type)
          ..add('template', template)
          ..add('settings', settings))
        .toString();
  }
}

class DeviceSettingsBuilder
    implements Builder<DeviceSettings, DeviceSettingsBuilder> {
  _$DeviceSettings _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _driver;
  String get driver => _$this._driver;
  set driver(String driver) => _$this._driver = driver;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _pairing;
  String get pairing => _$this._pairing;
  set pairing(String pairing) => _$this._pairing = pairing;

  String _pluginName;
  String get pluginName => _$this._pluginName;
  set pluginName(String pluginName) => _$this._pluginName = pluginName;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  MapBuilder<String, JsonObject> _template;
  MapBuilder<String, JsonObject> get template =>
      _$this._template ??= new MapBuilder<String, JsonObject>();
  set template(MapBuilder<String, JsonObject> template) =>
      _$this._template = template;

  MapBuilder<String, JsonObject> _settings;
  MapBuilder<String, JsonObject> get settings =>
      _$this._settings ??= new MapBuilder<String, JsonObject>();
  set settings(MapBuilder<String, JsonObject> settings) =>
      _$this._settings = settings;

  DeviceSettingsBuilder() {
    DeviceSettings._initializeBuilder(this);
  }

  DeviceSettingsBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _driver = _$v.driver;
      _image = _$v.image;
      _pairing = _$v.pairing;
      _pluginName = _$v.pluginName;
      _description = _$v.description;
      _type = _$v.type;
      _template = _$v.template?.toBuilder();
      _settings = _$v.settings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceSettings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeviceSettings;
  }

  @override
  void update(void Function(DeviceSettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeviceSettings build() {
    _$DeviceSettings _$result;
    try {
      _$result = _$v ??
          new _$DeviceSettings._(
              name: name,
              driver: driver,
              image: image,
              pairing: pairing,
              pluginName: pluginName,
              description: description,
              type: type,
              template: template.build(),
              settings: _settings?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'template';
        template.build();
        _$failedField = 'settings';
        _settings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DeviceSettings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
