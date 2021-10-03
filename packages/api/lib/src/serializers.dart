//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:lisa_server_sdk/src/date_serializer.dart';
import 'package:lisa_server_sdk/src/model/add_plugin_request.dart';
import 'package:lisa_server_sdk/src/model/create_device.dart';
import 'package:lisa_server_sdk/src/model/dashboard.dart';
import 'package:lisa_server_sdk/src/model/date.dart';
import 'package:lisa_server_sdk/src/model/device.dart';
import 'package:lisa_server_sdk/src/model/device_settings.dart';
import 'package:lisa_server_sdk/src/model/device_type_enum.dart';
import 'package:lisa_server_sdk/src/model/interact_request.dart';
import 'package:lisa_server_sdk/src/model/interact_response.dart';
import 'package:lisa_server_sdk/src/model/is_initialized.dart';
import 'package:lisa_server_sdk/src/model/login_request.dart';
import 'package:lisa_server_sdk/src/model/login_response.dart';
import 'package:lisa_server_sdk/src/model/plugin.dart';
import 'package:lisa_server_sdk/src/model/refresh_token_request.dart';
import 'package:lisa_server_sdk/src/model/room.dart';
import 'package:lisa_server_sdk/src/model/scene.dart';
import 'package:lisa_server_sdk/src/model/scene_data.dart';
import 'package:lisa_server_sdk/src/model/store_plugin.dart';
import 'package:lisa_server_sdk/src/model/update_device_info_request.dart';
import 'package:lisa_server_sdk/src/model/user.dart';
import 'package:lisa_server_sdk/src/model/user_update.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddPluginRequest,
  CreateDevice,
  Dashboard,
  Device,
  DeviceSettings,
  DeviceTypeEnum,
  InteractRequest,
  InteractResponse,
  IsInitialized,
  LoginRequest,
  LoginResponse,
  Plugin,
  RefreshTokenRequest,
  Room,
  Scene,
  SceneData,
  StorePlugin,
  UpdateDeviceInfoRequest,
  User,
  UserUpdate,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(int)]),
        () => ListBuilder<int>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Device)]),
        () => ListBuilder<Device>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        () => MapBuilder<String, JsonObject>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Device)]),
        () => ListBuilder<Device>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        () => MapBuilder<String, JsonObject>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Plugin)]),
        () => ListBuilder<Plugin>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(StorePlugin)]),
        () => ListBuilder<StorePlugin>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Room)]),
        () => ListBuilder<Room>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Scene)]),
        () => ListBuilder<Scene>(),
      )
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
