# lisa_server_sdk.api.DeviceApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteDevice**](DeviceApi.md#deleteDevice) | **Delete** /api/v1/device/:deviceId | 
[**saveDeviceName**](DeviceApi.md#saveDeviceName) | **Patch** /api/v1/device/:deviceId | 
[**updateDevice**](DeviceApi.md#updateDevice) | **Post** /api/v1/plugins/:pluginName/:deviceId | 


# **deleteDevice**
> deleteDevice(deviceId)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new DeviceApi();
var deviceId = 56; // int | 

try { 
    api_instance.deleteDevice(deviceId);
} catch (e) {
    print("Exception when calling DeviceApi->deleteDevice: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **int**|  | [default to null]

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveDeviceName**
> saveDeviceName(deviceId, updateDeviceNameRequest)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new DeviceApi();
var deviceId = 56; // int | 
var updateDeviceNameRequest = new UpdateDeviceNameRequest(); // UpdateDeviceNameRequest | 

try { 
    api_instance.saveDeviceName(deviceId, updateDeviceNameRequest);
} catch (e) {
    print("Exception when calling DeviceApi->saveDeviceName: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **int**|  | [default to null]
 **updateDeviceNameRequest** | [**UpdateDeviceNameRequest**](UpdateDeviceNameRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDevice**
> Device updateDevice(deviceId, pluginName, requestBody)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new DeviceApi();
var deviceId = 56; // int | 
var pluginName = pluginName_example; // String | 
var requestBody = new Map&lt;String, Object&gt;(); // Map<String, Object> | 

try { 
    var result = api_instance.updateDevice(deviceId, pluginName, requestBody);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->updateDevice: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **int**|  | [default to null]
 **pluginName** | **String**|  | [default to null]
 **requestBody** | [**Map&lt;String, Object&gt;**](Object.md)|  | [optional] 

### Return type

[**Device**](Device.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

