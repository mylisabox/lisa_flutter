# lisa_server_sdk.api.PluginApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://mylisabox:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getStorePlugins**](PluginApi.md#getstoreplugins) | **GET** /api/v1/plugins/store | 
[**installPlugin**](PluginApi.md#installplugin) | **POST** /api/v1/plugins/install | 
[**pairing**](PluginApi.md#pairing) | **POST** /api/v1/plugins/{pluginName}/drivers/{driver}/pairing | 
[**searchPlugins**](PluginApi.md#searchplugins) | **GET** /api/v1/plugins/search | 
[**uninstallPlugin**](PluginApi.md#uninstallplugin) | **DELETE** /api/v1/plugins/{pluginName}/uninstall | 


# **getStorePlugins**
> BuiltList<StorePlugin> getStorePlugins()



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getPluginApi();

try { 
    final response = api.getStorePlugins();
    print(response);
} catch on DioError (e) {
    print('Exception when calling PluginApi->getStorePlugins: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;StorePlugin&gt;**](StorePlugin.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **installPlugin**
> installPlugin(addPluginRequest)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getPluginApi();
final AddPluginRequest addPluginRequest = ; // AddPluginRequest | 

try { 
    api.installPlugin(addPluginRequest);
} catch on DioError (e) {
    print('Exception when calling PluginApi->installPlugin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addPluginRequest** | [**AddPluginRequest**](AddPluginRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pairing**
> BuiltMap<String, JsonObject> pairing(pluginName, driver, requestBody)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getPluginApi();
final String pluginName = pluginName_example; // String | 
final String driver = driver_example; // String | 
final BuiltMap<String, JsonObject> requestBody = Object; // BuiltMap<String, JsonObject> | 

try { 
    final response = api.pairing(pluginName, driver, requestBody);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PluginApi->pairing: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pluginName** | **String**|  | 
 **driver** | **String**|  | 
 **requestBody** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md)|  | 

### Return type

[**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchPlugins**
> BuiltList<Plugin> searchPlugins(query, activated)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getPluginApi();
final String query = query_example; // String | 
final bool activated = true; // bool | 

try { 
    final response = api.searchPlugins(query, activated);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PluginApi->searchPlugins: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**|  | 
 **activated** | **bool**|  | [optional] [default to true]

### Return type

[**BuiltList&lt;Plugin&gt;**](Plugin.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uninstallPlugin**
> uninstallPlugin(pluginName)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getPluginApi();
final String pluginName = pluginName_example; // String | 

try { 
    api.uninstallPlugin(pluginName);
} catch on DioError (e) {
    print('Exception when calling PluginApi->uninstallPlugin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pluginName** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

