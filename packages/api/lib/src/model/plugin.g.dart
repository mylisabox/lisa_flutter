// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Plugin extends Plugin {
  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final BuiltList<DeviceSettings>? devicesSettings;

  factory _$Plugin([void Function(PluginBuilder)? updates]) =>
      (new PluginBuilder()..update(updates)).build();

  _$Plugin._(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      this.devicesSettings})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Plugin', 'id');
    BuiltValueNullFieldError.checkNotNull(name, 'Plugin', 'name');
  }

  @override
  Plugin rebuild(void Function(PluginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PluginBuilder toBuilder() => new PluginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Plugin &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        image == other.image &&
        devicesSettings == other.devicesSettings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), description.hashCode),
            image.hashCode),
        devicesSettings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Plugin')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('image', image)
          ..add('devicesSettings', devicesSettings))
        .toString();
  }
}

class PluginBuilder implements Builder<Plugin, PluginBuilder> {
  _$Plugin? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<DeviceSettings>? _devicesSettings;
  ListBuilder<DeviceSettings> get devicesSettings =>
      _$this._devicesSettings ??= new ListBuilder<DeviceSettings>();
  set devicesSettings(ListBuilder<DeviceSettings>? devicesSettings) =>
      _$this._devicesSettings = devicesSettings;

  PluginBuilder() {
    Plugin._defaults(this);
  }

  PluginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _image = $v.image;
      _devicesSettings = $v.devicesSettings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Plugin other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Plugin;
  }

  @override
  void update(void Function(PluginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Plugin build() {
    _$Plugin _$result;
    try {
      _$result = _$v ??
          new _$Plugin._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Plugin', 'id'),
              name:
                  BuiltValueNullFieldError.checkNotNull(name, 'Plugin', 'name'),
              description: description,
              image: image,
              devicesSettings: _devicesSettings?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'devicesSettings';
        _devicesSettings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Plugin', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
