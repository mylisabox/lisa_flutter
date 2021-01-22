//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:lisa_server_sdk/model/add_plugin_request.dart';
import 'package:lisa_server_sdk/model/dashboard.dart';
import 'package:lisa_server_sdk/model/device.dart';
import 'package:lisa_server_sdk/model/device_settings.dart';
import 'package:lisa_server_sdk/model/interact_request.dart';
import 'package:lisa_server_sdk/model/interact_response.dart';
import 'package:lisa_server_sdk/model/is_initialized.dart';
import 'package:lisa_server_sdk/model/login_request.dart';
import 'package:lisa_server_sdk/model/login_response.dart';
import 'package:lisa_server_sdk/model/plugin.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:lisa_server_sdk/model/scene.dart';
import 'package:lisa_server_sdk/model/scene_data.dart';
import 'package:lisa_server_sdk/model/store_plugin.dart';
import 'package:lisa_server_sdk/model/update_device_info_request.dart';
import 'package:lisa_server_sdk/model/user.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AddPluginRequest,
  Dashboard,
  Device,
  DeviceSettings,
  InteractRequest,
  InteractResponse,
  IsInitialized,
  LoginRequest,
  LoginResponse,
  Plugin,
  Room,
  Scene,
  SceneData,
  StorePlugin,
  UpdateDeviceInfoRequest,
  User,
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
        const FullType(BuiltList, [FullType(StorePlugin)]),
        () => ListBuilder<StorePlugin>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Plugin)]),
        () => ListBuilder<Plugin>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        () => MapBuilder<String, JsonObject>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Room)]),
        () => ListBuilder<Room>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Scene)]),
        () => ListBuilder<Scene>(),
      )
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
