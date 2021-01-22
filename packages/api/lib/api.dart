//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

library lisa_server_sdk.api;

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:lisa_server_sdk/api/chatbot_api.dart';
import 'package:lisa_server_sdk/api/config_api.dart';
import 'package:lisa_server_sdk/api/dashboard_api.dart';
import 'package:lisa_server_sdk/api/device_api.dart';
import 'package:lisa_server_sdk/api/favorite_api.dart';
import 'package:lisa_server_sdk/api/login_api.dart';
import 'package:lisa_server_sdk/api/plugin_api.dart';
import 'package:lisa_server_sdk/api/room_api.dart';
import 'package:lisa_server_sdk/api/scene_api.dart';
import 'package:lisa_server_sdk/api/setup_api.dart';
import 'package:lisa_server_sdk/api/user_api.dart';
import 'package:lisa_server_sdk/auth/api_key_auth.dart';
import 'package:lisa_server_sdk/auth/basic_auth.dart';
import 'package:lisa_server_sdk/auth/oauth.dart';
import 'package:lisa_server_sdk/serializers.dart';


final _defaultInterceptors = [OAuthInterceptor(), BasicAuthInterceptor(), ApiKeyAuthInterceptor()];

class LisaServerSdk {

    Dio dio;
    Serializers serializers;
    String basePath = 'http://localhost:3000';

    LisaServerSdk({this.dio, Serializers serializers, String basePathOverride, List<Interceptor> interceptors}) {
        if (dio == null) {
            BaseOptions options = new BaseOptions(
                baseUrl: basePathOverride ?? basePath,
                connectTimeout: 5000,
                receiveTimeout: 3000,
            );
            this.dio = new Dio(options);
        }

        if (interceptors == null) {
            this.dio.interceptors.addAll(_defaultInterceptors);
        } else {
            this.dio.interceptors.addAll(interceptors);
        }

        this.serializers = serializers ?? standardSerializers;
    }

    void setOAuthToken(String name, String token) {
        (this.dio.interceptors.firstWhere((element) => element is OAuthInterceptor, orElse: null) as OAuthInterceptor)?.tokens[name] = token;
    }

    void setBasicAuth(String name, String username, String password) {
        (this.dio.interceptors.firstWhere((element) => element is BasicAuthInterceptor, orElse: null) as BasicAuthInterceptor)?.authInfo[name] = BasicAuthInfo(username, password);
    }

    void setApiKey(String name, String apiKey) {
        (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor, orElse: null) as ApiKeyAuthInterceptor)?.apiKeys[name] = apiKey;
    }


    /**
    * Get ChatbotApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    ChatbotApi getChatbotApi() {
    return ChatbotApi(dio, serializers);
    }


    /**
    * Get ConfigApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    ConfigApi getConfigApi() {
    return ConfigApi(dio, serializers);
    }


    /**
    * Get DashboardApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    DashboardApi getDashboardApi() {
    return DashboardApi(dio, serializers);
    }


    /**
    * Get DeviceApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    DeviceApi getDeviceApi() {
    return DeviceApi(dio, serializers);
    }


    /**
    * Get FavoriteApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    FavoriteApi getFavoriteApi() {
    return FavoriteApi(dio, serializers);
    }


    /**
    * Get LoginApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    LoginApi getLoginApi() {
    return LoginApi(dio, serializers);
    }


    /**
    * Get PluginApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    PluginApi getPluginApi() {
    return PluginApi(dio, serializers);
    }


    /**
    * Get RoomApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    RoomApi getRoomApi() {
    return RoomApi(dio, serializers);
    }


    /**
    * Get SceneApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    SceneApi getSceneApi() {
    return SceneApi(dio, serializers);
    }


    /**
    * Get SetupApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    SetupApi getSetupApi() {
    return SetupApi(dio, serializers);
    }


    /**
    * Get UserApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    UserApi getUserApi() {
    return UserApi(dio, serializers);
    }


}
