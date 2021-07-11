# lisa_server_sdk.api.PluginApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getStorePlugins**](PluginApi.md#getstoreplugins) | **get** /api/v1/plugin/store | 
[**installPlugin**](PluginApi.md#installplugin) | **post** /api/v1/plugin/install | 
[**pairing**](PluginApi.md#pairing) | **post** /api/v1/plugin/{pluginName}/drivers/{driver}/pairing | 
[**searchPlugins**](PluginApi.md#searchplugins) | **get** /api/v1/plugin/search | 
[**uninstallPlugin**](PluginApi.md#uninstallplugin) | **delete** /api/v1/plugin/{pluginName}/uninstall | 


# **getStorePlugins**
> BuiltList<StorePlugin> getStorePlugins()



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new PluginApi();

try { 
    var result = api_instance.getStorePlugins();
    print(result);
} catch (e) {
    print('Exception when calling PluginApi->getStorePlugins: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList<StorePlugin>**](StorePlugin.md)

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

var api_instance = new PluginApi();
var addPluginRequest = new AddPluginRequest(); // AddPluginRequest | 

try { 
    api_instance.installPlugin(addPluginRequest);
} catch (e) {
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

var api_instance = new PluginApi();
var pluginName = pluginName_example; // String | 
var driver = driver_example; // String | 
var requestBody = new BuiltMap<String, JsonObject>(); // BuiltMap<String, JsonObject> | 

try { 
    var result = api_instance.pairing(pluginName, driver, requestBody);
    print(result);
} catch (e) {
    print('Exception when calling PluginApi->pairing: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pluginName** | **String**|  | 
 **driver** | **String**|  | 
 **requestBody** | [**BuiltMap<String, JsonObject>**](JsonObject.md)|  | 

### Return type

[**BuiltMap<String, JsonObject>**](JsonObject.md)

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

var api_instance = new PluginApi();
var query = query_example; // String | 
var activated = true; // bool | 

try { 
    var result = api_instance.searchPlugins(query, activated);
    print(result);
} catch (e) {
    print('Exception when calling PluginApi->searchPlugins: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**|  | 
 **activated** | **bool**|  | [optional] [default to true]

### Return type

[**BuiltList<Plugin>**](Plugin.md)

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

var api_instance = new PluginApi();
var pluginName = pluginName_example; // String | 

try { 
    api_instance.uninstallPlugin(pluginName);
} catch (e) {
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

