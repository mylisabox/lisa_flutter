//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:lisa_server_sdk/src/api/auth_api.dart';
import 'package:lisa_server_sdk/src/api/chatbot_api.dart';
import 'package:lisa_server_sdk/src/api/config_api.dart';
import 'package:lisa_server_sdk/src/api/device_api.dart';
import 'package:lisa_server_sdk/src/api/plugin_api.dart';
import 'package:lisa_server_sdk/src/api/room_api.dart';
import 'package:lisa_server_sdk/src/api/scene_api.dart';
import 'package:lisa_server_sdk/src/api/setup_api.dart';
import 'package:lisa_server_sdk/src/api/user_api.dart';
import 'package:lisa_server_sdk/src/auth/api_key_auth.dart';
import 'package:lisa_server_sdk/src/auth/basic_auth.dart';
import 'package:lisa_server_sdk/src/auth/bearer_auth.dart';
import 'package:lisa_server_sdk/src/auth/oauth.dart';
import 'package:lisa_server_sdk/src/serializers.dart';

class LisaServerSdk {
  static const String basePath = r'http://mylisabox:3000';

  final Dio dio;
  final Serializers serializers;

  LisaServerSdk({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: 5000,
              receiveTimeout: 3000,
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthApi getAuthApi() {
    return AuthApi(dio, serializers);
  }

  /// Get ChatbotApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ChatbotApi getChatbotApi() {
    return ChatbotApi(dio, serializers);
  }

  /// Get ConfigApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ConfigApi getConfigApi() {
    return ConfigApi(dio, serializers);
  }

  /// Get DeviceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DeviceApi getDeviceApi() {
    return DeviceApi(dio, serializers);
  }

  /// Get PluginApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PluginApi getPluginApi() {
    return PluginApi(dio, serializers);
  }

  /// Get RoomApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RoomApi getRoomApi() {
    return RoomApi(dio, serializers);
  }

  /// Get SceneApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SceneApi getSceneApi() {
    return SceneApi(dio, serializers);
  }

  /// Get SetupApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SetupApi getSetupApi() {
    return SetupApi(dio, serializers);
  }

  /// Get UserApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserApi getUserApi() {
    return UserApi(dio, serializers);
  }
}
