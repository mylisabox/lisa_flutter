// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeviceSettings extends DeviceSettings {
  @override
  final String name;
  @override
  final String driver;
  @override
  final String image;
  @override
  final String? imageOn;
  @override
  final String? imageOff;
  @override
  final String? defaultAction;
  @override
  final String pairing;
  @override
  final String pluginName;
  @override
  final String? description;
  @override
  final String? type;
  @override
  final BuiltMap<String, JsonObject> template;
  @override
  final BuiltMap<String, JsonObject>? settings;

  factory _$DeviceSettings([void Function(DeviceSettingsBuilder)? updates]) =>
      (new DeviceSettingsBuilder()..update(updates)).build();

  _$DeviceSettings._(
      {required this.name,
      required this.driver,
      required this.image,
      this.imageOn,
      this.imageOff,
      this.defaultAction,
      required this.pairing,
      required this.pluginName,
      this.description,
      this.type,
      required this.template,
      this.settings})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'DeviceSettings', 'name');
    BuiltValueNullFieldError.checkNotNull(driver, 'DeviceSettings', 'driver');
    BuiltValueNullFieldError.checkNotNull(image, 'DeviceSettings', 'image');
    BuiltValueNullFieldError.checkNotNull(pairing, 'DeviceSettings', 'pairing');
    BuiltValueNullFieldError.checkNotNull(
        pluginName, 'DeviceSettings', 'pluginName');
    BuiltValueNullFieldError.checkNotNull(
        template, 'DeviceSettings', 'template');
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
        imageOn == other.imageOn &&
        imageOff == other.imageOff &&
        defaultAction == other.defaultAction &&
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
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, name.hashCode),
                                                driver.hashCode),
                                            image.hashCode),
                                        imageOn.hashCode),
                                    imageOff.hashCode),
                                defaultAction.hashCode),
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
          ..add('imageOn', imageOn)
          ..add('imageOff', imageOff)
          ..add('defaultAction', defaultAction)
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
  _$DeviceSettings? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _driver;
  String? get driver => _$this._driver;
  set driver(String? driver) => _$this._driver = driver;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _imageOn;
  String? get imageOn => _$this._imageOn;
  set imageOn(String? imageOn) => _$this._imageOn = imageOn;

  String? _imageOff;
  String? get imageOff => _$this._imageOff;
  set imageOff(String? imageOff) => _$this._imageOff = imageOff;

  String? _defaultAction;
  String? get defaultAction => _$this._defaultAction;
  set defaultAction(String? defaultAction) =>
      _$this._defaultAction = defaultAction;

  String? _pairing;
  String? get pairing => _$this._pairing;
  set pairing(String? pairing) => _$this._pairing = pairing;

  String? _pluginName;
  String? get pluginName => _$this._pluginName;
  set pluginName(String? pluginName) => _$this._pluginName = pluginName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  MapBuilder<String, JsonObject>? _template;
  MapBuilder<String, JsonObject> get template =>
      _$this._template ??= new MapBuilder<String, JsonObject>();
  set template(MapBuilder<String, JsonObject>? template) =>
      _$this._template = template;

  MapBuilder<String, JsonObject>? _settings;
  MapBuilder<String, JsonObject> get settings =>
      _$this._settings ??= new MapBuilder<String, JsonObject>();
  set settings(MapBuilder<String, JsonObject>? settings) =>
      _$this._settings = settings;

  DeviceSettingsBuilder() {
    DeviceSettings._defaults(this);
  }

  DeviceSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _driver = $v.driver;
      _image = $v.image;
      _imageOn = $v.imageOn;
      _imageOff = $v.imageOff;
      _defaultAction = $v.defaultAction;
      _pairing = $v.pairing;
      _pluginName = $v.pluginName;
      _description = $v.description;
      _type = $v.type;
      _template = $v.template.toBuilder();
      _settings = $v.settings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeviceSettings;
  }

  @override
  void update(void Function(DeviceSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeviceSettings build() {
    _$DeviceSettings _$result;
    try {
      _$result = _$v ??
          new _$DeviceSettings._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'DeviceSettings', 'name'),
              driver: BuiltValueNullFieldError.checkNotNull(
                  driver, 'DeviceSettings', 'driver'),
              image: BuiltValueNullFieldError.checkNotNull(
                  image, 'DeviceSettings', 'image'),
              imageOn: imageOn,
              imageOff: imageOff,
              defaultAction: defaultAction,
              pairing: BuiltValueNullFieldError.checkNotNull(
                  pairing, 'DeviceSettings', 'pairing'),
              pluginName: BuiltValueNullFieldError.checkNotNull(
                  pluginName, 'DeviceSettings', 'pluginName'),
              description: description,
              type: type,
              template: template.build(),
              settings: _settings?.build());
    } catch (_) {
      late String _$failedField;
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
