library lisa_server_sdk.api;

import 'package:http/http.dart' as http;
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:lisa_server_sdk/auth/api_key_auth.dart';
import 'package:lisa_server_sdk/auth/basic_auth.dart';
import 'package:lisa_server_sdk/auth/oauth.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';

import 'package:lisa_server_sdk/api/chatbot_api.dart';
import 'package:lisa_server_sdk/api/config_api.dart';
import 'package:lisa_server_sdk/api/dashboard_api.dart';
import 'package:lisa_server_sdk/api/device_api.dart';
import 'package:lisa_server_sdk/api/favorite_api.dart';
import 'package:lisa_server_sdk/api/login_api.dart';
import 'package:lisa_server_sdk/api/plugin_api.dart';
import 'package:lisa_server_sdk/api/room_api.dart';
import 'package:lisa_server_sdk/api/scene_api.dart';
import 'package:lisa_server_sdk/api/user_api.dart';

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
import 'package:lisa_server_sdk/model/update_device_info_request.dart';
import 'package:lisa_server_sdk/model/user.dart';
import 'package:lisa_server_sdk/model/user_update.dart';



final _jsonJaguarRepo = JsonRepo()
..add(DashboardSerializer())
..add(DeviceSerializer())
..add(DeviceSettingsSerializer())
..add(InteractRequestSerializer())
..add(InteractResponseSerializer())
..add(IsInitializedSerializer())
..add(LoginRequestSerializer())
..add(LoginResponseSerializer())
..add(PluginSerializer())
..add(RoomSerializer())
..add(SceneSerializer())
..add(SceneDataSerializer())
..add(UpdateDeviceInfoRequestSerializer())
..add(UserSerializer())
..add(UserUpdateSerializer())
;
final Map<String, CodecRepo> defaultConverters = {
    MimeTypes.json: _jsonJaguarRepo,
};



final _defaultInterceptors = [OAuthInterceptor(), BasicAuthInterceptor(), ApiKeyAuthInterceptor()];

class LisaServerSdk {
    List<Interceptor> interceptors;
    String basePath = "http://localhost:3000";
    Route _baseRoute;
    final Duration timeout;

    /**
    * Add custom global interceptors, put overrideInterceptors to true to set your interceptors only (auth interceptors will not be added)
    */
    LisaServerSdk({List<Interceptor> interceptors, bool overrideInterceptors = false, String baseUrl, this.timeout = const Duration(minutes: 2)}) {
        _baseRoute = Route(baseUrl ?? basePath).withClient(globalClient ?? http.Client());
        if(interceptors == null) {
            this.interceptors = _defaultInterceptors;
        }
        else if(overrideInterceptors){
            this.interceptors = interceptors;
        }
        else {
            this.interceptors = List.from(_defaultInterceptors)..addAll(interceptors);
        }

        this.interceptors.forEach((interceptor) {
            _baseRoute.before(interceptor.before);
            _baseRoute.after(interceptor.after);
        });
    }

    void setOAuthToken(String name, String token) {
        (_defaultInterceptors[0] as OAuthInterceptor).tokens[name] = token;
    }

    void setBasicAuth(String name, String username, String password) {
        (_defaultInterceptors[1] as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }

    void setApiKey(String name, String apiKey) {
        (_defaultInterceptors[2] as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }

    
    /**
    * Get ChatbotApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    ChatbotApi getChatbotApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return ChatbotApi(base: base, converters: converters, timeout: timeout);
    }

    
    /**
    * Get ConfigApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    ConfigApi getConfigApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return ConfigApi(base: base, converters: converters, timeout: timeout);
    }

    
    /**
    * Get DashboardApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    DashboardApi getDashboardApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return DashboardApi(base: base, converters: converters, timeout: timeout);
    }

    
    /**
    * Get DeviceApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    DeviceApi getDeviceApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return DeviceApi(base: base, converters: converters, timeout: timeout);
    }

    
    /**
    * Get FavoriteApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    FavoriteApi getFavoriteApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return FavoriteApi(base: base, converters: converters, timeout: timeout);
    }

    
    /**
    * Get LoginApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    LoginApi getLoginApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return LoginApi(base: base, converters: converters, timeout: timeout);
    }

    
    /**
    * Get PluginApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    PluginApi getPluginApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return PluginApi(base: base, converters: converters, timeout: timeout);
    }

    
    /**
    * Get RoomApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    RoomApi getRoomApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return RoomApi(base: base, converters: converters, timeout: timeout);
    }

    
    /**
    * Get SceneApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    SceneApi getSceneApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return SceneApi(base: base, converters: converters, timeout: timeout);
    }

    
    /**
    * Get UserApi instance, base route and serializer can be overridden by a given but be careful,
    * by doing that all interceptors will not be executed
    */
    UserApi getUserApi({Route base, Map<String, CodecRepo> converters}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(converters == null) {
            converters = defaultConverters;
        }
        return UserApi(base: base, converters: converters, timeout: timeout);
    }

    
}
