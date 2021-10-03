// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Device extends Device {
  @override
  final int id;
  @override
  final int? roomId;
  @override
  final bool? grouped;
  @override
  final int? groupCount;
  @override
  final BuiltList<Device>? children;
  @override
  final String name;
  @override
  final String? defaultAction;
  @override
  final String? driver;
  @override
  final bool powered;
  @override
  final String? imageOn;
  @override
  final String? imageOff;
  @override
  final int sortOrder;
  @override
  final String pluginName;
  @override
  final DeviceTypeEnum type;
  @override
  final BuiltMap<String, JsonObject>? template;
  @override
  final BuiltMap<String, JsonObject>? data;
  @override
  final bool favorite;

  factory _$Device([void Function(DeviceBuilder)? updates]) =>
      (new DeviceBuilder()..update(updates)).build();

  _$Device._(
      {required this.id,
      this.roomId,
      this.grouped,
      this.groupCount,
      this.children,
      required this.name,
      this.defaultAction,
      this.driver,
      required this.powered,
      this.imageOn,
      this.imageOff,
      required this.sortOrder,
      required this.pluginName,
      required this.type,
      this.template,
      this.data,
      required this.favorite})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Device', 'id');
    BuiltValueNullFieldError.checkNotNull(name, 'Device', 'name');
    BuiltValueNullFieldError.checkNotNull(powered, 'Device', 'powered');
    BuiltValueNullFieldError.checkNotNull(sortOrder, 'Device', 'sortOrder');
    BuiltValueNullFieldError.checkNotNull(pluginName, 'Device', 'pluginName');
    BuiltValueNullFieldError.checkNotNull(type, 'Device', 'type');
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
        grouped == other.grouped &&
        groupCount == other.groupCount &&
        children == other.children &&
        name == other.name &&
        defaultAction == other.defaultAction &&
        driver == other.driver &&
        powered == other.powered &&
        imageOn == other.imageOn &&
        imageOff == other.imageOff &&
        sortOrder == other.sortOrder &&
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
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        id
                                                                            .hashCode),
                                                                    roomId
                                                                        .hashCode),
                                                                grouped
                                                                    .hashCode),
                                                            groupCount
                                                                .hashCode),
                                                        children.hashCode),
                                                    name.hashCode),
                                                defaultAction.hashCode),
                                            driver.hashCode),
                                        powered.hashCode),
                                    imageOn.hashCode),
                                imageOff.hashCode),
                            sortOrder.hashCode),
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
          ..add('grouped', grouped)
          ..add('groupCount', groupCount)
          ..add('children', children)
          ..add('name', name)
          ..add('defaultAction', defaultAction)
          ..add('driver', driver)
          ..add('powered', powered)
          ..add('imageOn', imageOn)
          ..add('imageOff', imageOff)
          ..add('sortOrder', sortOrder)
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

  bool? _grouped;
  bool? get grouped => _$this._grouped;
  set grouped(bool? grouped) => _$this._grouped = grouped;

  int? _groupCount;
  int? get groupCount => _$this._groupCount;
  set groupCount(int? groupCount) => _$this._groupCount = groupCount;

  ListBuilder<Device>? _children;
  ListBuilder<Device> get children =>
      _$this._children ??= new ListBuilder<Device>();
  set children(ListBuilder<Device>? children) => _$this._children = children;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _defaultAction;
  String? get defaultAction => _$this._defaultAction;
  set defaultAction(String? defaultAction) =>
      _$this._defaultAction = defaultAction;

  String? _driver;
  String? get driver => _$this._driver;
  set driver(String? driver) => _$this._driver = driver;

  bool? _powered;
  bool? get powered => _$this._powered;
  set powered(bool? powered) => _$this._powered = powered;

  String? _imageOn;
  String? get imageOn => _$this._imageOn;
  set imageOn(String? imageOn) => _$this._imageOn = imageOn;

  String? _imageOff;
  String? get imageOff => _$this._imageOff;
  set imageOff(String? imageOff) => _$this._imageOff = imageOff;

  int? _sortOrder;
  int? get sortOrder => _$this._sortOrder;
  set sortOrder(int? sortOrder) => _$this._sortOrder = sortOrder;

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

  bool? _favorite;
  bool? get favorite => _$this._favorite;
  set favorite(bool? favorite) => _$this._favorite = favorite;

  DeviceBuilder() {
    Device._defaults(this);
  }

  DeviceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _roomId = $v.roomId;
      _grouped = $v.grouped;
      _groupCount = $v.groupCount;
      _children = $v.children?.toBuilder();
      _name = $v.name;
      _defaultAction = $v.defaultAction;
      _driver = $v.driver;
      _powered = $v.powered;
      _imageOn = $v.imageOn;
      _imageOff = $v.imageOff;
      _sortOrder = $v.sortOrder;
      _pluginName = $v.pluginName;
      _type = $v.type;
      _template = $v.template?.toBuilder();
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
              roomId: roomId,
              grouped: grouped,
              groupCount: groupCount,
              children: _children?.build(),
              name:
                  BuiltValueNullFieldError.checkNotNull(name, 'Device', 'name'),
              defaultAction: defaultAction,
              driver: driver,
              powered: BuiltValueNullFieldError.checkNotNull(
                  powered, 'Device', 'powered'),
              imageOn: imageOn,
              imageOff: imageOff,
              sortOrder: BuiltValueNullFieldError.checkNotNull(
                  sortOrder, 'Device', 'sortOrder'),
              pluginName: BuiltValueNullFieldError.checkNotNull(
                  pluginName, 'Device', 'pluginName'),
              type:
                  BuiltValueNullFieldError.checkNotNull(type, 'Device', 'type'),
              template: _template?.build(),
              data: _data?.build(),
              favorite: BuiltValueNullFieldError.checkNotNull(
                  favorite, 'Device', 'favorite'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'children';
        _children?.build();

        _$failedField = 'template';
        _template?.build();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
