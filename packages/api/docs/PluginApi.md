# lisa_server_sdk.api.PluginApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pairing**](PluginApi.md#pairing) | **Post** /api/v1/plugin/:pluginName/drivers/:driver/pairing | 
[**searchPlugins**](PluginApi.md#searchPlugins) | **Get** /api/v1/plugin/search | 


# **pairing**
> PairingResponse pairing(pluginName, driver, requestBody)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new PluginApi();
var pluginName = pluginName_example; // String | 
var driver = driver_example; // String | 
var requestBody = new Map&lt;String, Object&gt;(); // Map<String, Object> | 

try { 
    var result = api_instance.pairing(pluginName, driver, requestBody);
    print(result);
} catch (e) {
    print("Exception when calling PluginApi->pairing: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pluginName** | **String**|  | [default to null]
 **driver** | **String**|  | [default to null]
 **requestBody** | [**Map&lt;String, Object&gt;**](Object.md)|  | [optional] 

### Return type

[**PairingResponse**](PairingResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchPlugins**
> List<Plugin> searchPlugins(query, activated)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new PluginApi();
var query = query_example; // String | 
var activated = true; // bool | 

try { 
    var result = api_instance.searchPlugins(query, activated);
    print(result);
} catch (e) {
    print("Exception when calling PluginApi->searchPlugins: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**|  | [default to null]
 **activated** | **bool**|  | [optional] [default to true]

### Return type

[**List<Plugin>**](Plugin.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

