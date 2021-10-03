# lisa_server_sdk.api.SceneApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://mylisabox:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteScene**](SceneApi.md#deletescene) | **DELETE** /api/v1/chatBots/userBot/{scene} | 
[**getScene**](SceneApi.md#getscene) | **GET** /api/v1/chatBots/userBot | 
[**saveScene**](SceneApi.md#savescene) | **POST** /api/v1/chatBots/userBot | 


# **deleteScene**
> deleteScene(scene)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getSceneApi();
final String scene = scene_example; // String | 

try { 
    api.deleteScene(scene);
} catch on DioError (e) {
    print('Exception when calling SceneApi->deleteScene: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scene** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getScene**
> BuiltList<Scene> getScene()



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getSceneApi();

try { 
    final response = api.getScene();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SceneApi->getScene: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Scene&gt;**](Scene.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveScene**
> saveScene(scene)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getSceneApi();
final Scene scene = ; // Scene | 

try { 
    api.saveScene(scene);
} catch on DioError (e) {
    print('Exception when calling SceneApi->saveScene: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scene** | [**Scene**](Scene.md)|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

