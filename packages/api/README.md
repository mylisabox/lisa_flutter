# lisa_server_sdk (EXPERIMENTAL)
L.I.S.A. API v1

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v1
- Build package: org.openapitools.codegen.languages.DartDioNextClientCodegen

## Requirements

* Dart 2.12.0 or later OR Flutter 1.26.0 or later
* Dio 4.0.0+

## Installation & Usage

### pub.dev
To use the package from [pub.dev](https://pub.dev), please include the following in pubspec.yaml
```yaml
dependencies:
  lisa_server_sdk: 1.0.0
```

### Github
If this Dart package is published to Github, please include the following in pubspec.yaml
```yaml
dependencies:
  lisa_server_sdk:
    git:
      url: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
      #ref: main
```

### Local development
To use the package from your local drive, please include the following in pubspec.yaml
```yaml
dependencies:
  lisa_server_sdk:
    path: /path/to/lisa_server_sdk
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:lisa_server_sdk/lisa_server_sdk.dart';


final api = ChatbotApi();
final interactRequest = InteractRequest(); // InteractRequest | 

try {
    final response = await api.interact(interactRequest);
    print(response);
} catch on DioError (e) {
    print("Exception when calling ChatbotApi->interact: $e\n");
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost:3000*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ChatbotApi* | [**interact**](doc/ChatbotApi.md#interact) | **post** /api/v1/chatbot/interact | 
*ConfigApi* | [**isInitialized**](doc/ConfigApi.md#isinitialized) | **get** /api/v1/initialized | 
*DashboardApi* | [**getDashboard**](doc/DashboardApi.md#getdashboard) | **get** /api/v1/dashboard/room/{roomId} | 
*DashboardApi* | [**saveDashboard**](doc/DashboardApi.md#savedashboard) | **post** /api/v1/dashboard/room/{roomId} | 
*DeviceApi* | [**addDevice**](doc/DeviceApi.md#adddevice) | **post** /api/v1/device/ | 
*DeviceApi* | [**deleteDevice**](doc/DeviceApi.md#deletedevice) | **delete** /api/v1/device/{deviceId} | 
*DeviceApi* | [**getDevices**](doc/DeviceApi.md#getdevices) | **get** /api/v1/device/ | 
*DeviceApi* | [**saveDeviceInfo**](doc/DeviceApi.md#savedeviceinfo) | **patch** /api/v1/device/{deviceId} | 
*DeviceApi* | [**updateDevice**](doc/DeviceApi.md#updatedevice) | **post** /api/v1/plugins/{pluginName}/{deviceId} | 
*DeviceApi* | [**updateGroup**](doc/DeviceApi.md#updategroup) | **post** /api/v1/devices/group/{roomId}/{groupId} | 
*FavoriteApi* | [**addToFavorite**](doc/FavoriteApi.md#addtofavorite) | **put** /api/v1/favorite/{deviceId} | 
*FavoriteApi* | [**deleteFromFavorite**](doc/FavoriteApi.md#deletefromfavorite) | **delete** /api/v1/favorite/{deviceId} | 
*FavoriteApi* | [**getFavorites**](doc/FavoriteApi.md#getfavorites) | **get** /api/v1/favorite | 
*LoginApi* | [**login**](doc/LoginApi.md#login) | **post** /api/v1/auth/local | 
*LoginApi* | [**logout**](doc/LoginApi.md#logout) | **get** /api/v1/auth/logout | 
*LoginApi* | [**register**](doc/LoginApi.md#register) | **post** /api/v1/auth/local/register | 
*PluginApi* | [**getStorePlugins**](doc/PluginApi.md#getstoreplugins) | **get** /api/v1/plugin/store | 
*PluginApi* | [**installPlugin**](doc/PluginApi.md#installplugin) | **post** /api/v1/plugin/install | 
*PluginApi* | [**pairing**](doc/PluginApi.md#pairing) | **post** /api/v1/plugin/{pluginName}/drivers/{driver}/pairing | 
*PluginApi* | [**searchPlugins**](doc/PluginApi.md#searchplugins) | **get** /api/v1/plugin/search | 
*PluginApi* | [**uninstallPlugin**](doc/PluginApi.md#uninstallplugin) | **delete** /api/v1/plugin/{pluginName}/uninstall | 
*RoomApi* | [**addRoom**](doc/RoomApi.md#addroom) | **post** /api/v1/room | 
*RoomApi* | [**deleteRoom**](doc/RoomApi.md#deleteroom) | **delete** /api/v1/room/{roomId} | 
*RoomApi* | [**getRooms**](doc/RoomApi.md#getrooms) | **get** /api/v1/room | 
*RoomApi* | [**saveRoom**](doc/RoomApi.md#saveroom) | **put** /api/v1/room/{roomId} | 
*SceneApi* | [**deleteScene**](doc/SceneApi.md#deletescene) | **delete** /api/v1/chatbot/userBot/{scene} | 
*SceneApi* | [**getScene**](doc/SceneApi.md#getscene) | **get** /api/v1/chatbot/userBot | 
*SceneApi* | [**saveScene**](doc/SceneApi.md#savescene) | **post** /api/v1/chatbot/userBot | 
*SetupApi* | [**setupVoiceCommands**](doc/SetupApi.md#setupvoicecommands) | **post** /api/v1/setup/voice_commands | 
*UserApi* | [**getProfile**](doc/UserApi.md#getprofile) | **get** /api/v1/user | 
*UserApi* | [**saveProfile**](doc/UserApi.md#saveprofile) | **post** /api/v1/user | 


## Documentation For Models

 - [AddPluginRequest](doc/AddPluginRequest.md)
 - [Dashboard](doc/Dashboard.md)
 - [Device](doc/Device.md)
 - [DeviceSettings](doc/DeviceSettings.md)
 - [InteractRequest](doc/InteractRequest.md)
 - [InteractResponse](doc/InteractResponse.md)
 - [IsInitialized](doc/IsInitialized.md)
 - [LoginRequest](doc/LoginRequest.md)
 - [LoginResponse](doc/LoginResponse.md)
 - [Plugin](doc/Plugin.md)
 - [Room](doc/Room.md)
 - [Scene](doc/Scene.md)
 - [SceneData](doc/SceneData.md)
 - [StorePlugin](doc/StorePlugin.md)
 - [UpdateDeviceInfoRequest](doc/UpdateDeviceInfoRequest.md)
 - [User](doc/User.md)


## Documentation For Authorization


## Bearer

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header


## Author

jimmy.aumard@gmail.com


