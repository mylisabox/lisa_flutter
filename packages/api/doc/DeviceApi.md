# lisa_server_sdk.api.DeviceApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addDevice**](DeviceApi.md#addDevice) | **post** /api/v1/device/ | 
[**deleteDevice**](DeviceApi.md#deleteDevice) | **delete** /api/v1/device/{deviceId} | 
[**getDevices**](DeviceApi.md#getDevices) | **get** /api/v1/device/ | 
[**saveDeviceInfo**](DeviceApi.md#saveDeviceInfo) | **patch** /api/v1/device/{deviceId} | 
[**updateDevice**](DeviceApi.md#updateDevice) | **post** /api/v1/plugins/{pluginName}/{deviceId} | 
[**updateGroup**](DeviceApi.md#updateGroup) | **post** /api/v1/devices/group/{roomId}/{groupId} | 


# **addDevice**
> addDevice(device)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new DeviceApi();
var device = new Device(); // Device | 

try { 
    api_instance.addDevice(device);
} catch (e) {
    print('Exception when calling DeviceApi->addDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **device** | [**Device**](Device.md)|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDevice**
> deleteDevice(deviceId)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new DeviceApi();
var deviceId = 56; // int | 

try { 
    api_instance.deleteDevice(deviceId);
} catch (e) {
    print('Exception when calling DeviceApi->deleteDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDevices**
> BuiltList<Device> getDevices(roomId)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new DeviceApi();
var roomId = roomId_example; // String | 

try { 
    var result = api_instance.getDevices(roomId);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->getDevices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **String**|  | 

### Return type

[**BuiltList<Device>**](Device.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveDeviceInfo**
> saveDeviceInfo(deviceId, updateDeviceInfoRequest)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new DeviceApi();
var deviceId = 56; // int | 
var updateDeviceInfoRequest = new UpdateDeviceInfoRequest(); // UpdateDeviceInfoRequest | 

try { 
    api_instance.saveDeviceInfo(deviceId, updateDeviceInfoRequest);
} catch (e) {
    print('Exception when calling DeviceApi->saveDeviceInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **int**|  | 
 **updateDeviceInfoRequest** | [**UpdateDeviceInfoRequest**](UpdateDeviceInfoRequest.md)|  | 

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
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new DeviceApi();
var deviceId = 56; // int | 
var pluginName = pluginName_example; // String | 
var requestBody = new BuiltMap<String, JsonObject>(); // BuiltMap<String, JsonObject> | 

try { 
    var result = api_instance.updateDevice(deviceId, pluginName, requestBody);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->updateDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **int**|  | 
 **pluginName** | **String**|  | 
 **requestBody** | [**BuiltMap<String, JsonObject>**](JsonObject.md)|  | 

### Return type

[**Device**](Device.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGroup**
> updateGroup(roomId, groupId, requestBody)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new DeviceApi();
var roomId = 56; // int | 
var groupId = 56; // int | 
var requestBody = new BuiltMap<String, JsonObject>(); // BuiltMap<String, JsonObject> | 

try { 
    api_instance.updateGroup(roomId, groupId, requestBody);
} catch (e) {
    print('Exception when calling DeviceApi->updateGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **int**|  | 
 **groupId** | **int**|  | 
 **requestBody** | [**BuiltMap<String, JsonObject>**](JsonObject.md)|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

