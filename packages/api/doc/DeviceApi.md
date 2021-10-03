# lisa_server_sdk.api.DeviceApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://mylisabox:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addDevice**](DeviceApi.md#adddevice) | **POST** /api/v1/devices/ | 
[**deleteDevice**](DeviceApi.md#deletedevice) | **DELETE** /api/v1/devices/{deviceId} | 
[**getDeviceData**](DeviceApi.md#getdevicedata) | **GET** /api/v1/devices/{deviceId}/data | 
[**getDevices**](DeviceApi.md#getdevices) | **GET** /api/v1/devices/ | 
[**saveDeviceInfo**](DeviceApi.md#savedeviceinfo) | **PATCH** /api/v1/devices/{deviceId} | 
[**triggerDevice**](DeviceApi.md#triggerdevice) | **GET** /api/v1/devices/{deviceId}/trigger | 
[**triggerGroup**](DeviceApi.md#triggergroup) | **POST** /api/v1/devices/groups/{deviceType} | 
[**updateDevice**](DeviceApi.md#updatedevice) | **POST** /api/v1/devices/{deviceId} | 
[**updateGroup**](DeviceApi.md#updategroup) | **POST** /api/v1/devices/groups/{type} | 


# **addDevice**
> addDevice(createDevice)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getDeviceApi();
final CreateDevice createDevice = ; // CreateDevice | 

try { 
    api.addDevice(createDevice);
} catch on DioError (e) {
    print('Exception when calling DeviceApi->addDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createDevice** | [**CreateDevice**](CreateDevice.md)|  | 

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

final api = LisaServerSdk().getDeviceApi();
final int deviceId = 56; // int | 

try { 
    api.deleteDevice(deviceId);
} catch on DioError (e) {
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

# **getDeviceData**
> Device getDeviceData(deviceId)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getDeviceApi();
final int deviceId = 56; // int | 

try { 
    final response = api.getDeviceData(deviceId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceApi->getDeviceData: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **int**|  | 

### Return type

[**Device**](Device.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

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

final api = LisaServerSdk().getDeviceApi();
final String roomId = roomId_example; // String | 

try { 
    final response = api.getDevices(roomId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceApi->getDevices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **String**|  | [optional] 

### Return type

[**BuiltList&lt;Device&gt;**](Device.md)

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

final api = LisaServerSdk().getDeviceApi();
final int deviceId = 56; // int | 
final UpdateDeviceInfoRequest updateDeviceInfoRequest = ; // UpdateDeviceInfoRequest | 

try { 
    api.saveDeviceInfo(deviceId, updateDeviceInfoRequest);
} catch on DioError (e) {
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

# **triggerDevice**
> triggerDevice(deviceId)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getDeviceApi();
final int deviceId = 56; // int | 

try { 
    api.triggerDevice(deviceId);
} catch on DioError (e) {
    print('Exception when calling DeviceApi->triggerDevice: $e\n');
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

# **triggerGroup**
> triggerGroup(deviceType, requestBody, roomId)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getDeviceApi();
final String deviceType = deviceType_example; // String | 
final BuiltMap<String, JsonObject> requestBody = Object; // BuiltMap<String, JsonObject> | 
final int roomId = 56; // int | 

try { 
    api.triggerGroup(deviceType, requestBody, roomId);
} catch on DioError (e) {
    print('Exception when calling DeviceApi->triggerGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceType** | **String**|  | 
 **requestBody** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md)|  | 
 **roomId** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDevice**
> Device updateDevice(deviceId, requestBody)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getDeviceApi();
final int deviceId = 56; // int | 
final BuiltMap<String, JsonObject> requestBody = Object; // BuiltMap<String, JsonObject> | 

try { 
    final response = api.updateDevice(deviceId, requestBody);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DeviceApi->updateDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **int**|  | 
 **requestBody** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md)|  | 

### Return type

[**Device**](Device.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGroup**
> updateGroup(type, requestBody, roomId)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getDeviceApi();
final String type = type_example; // String | 
final BuiltMap<String, JsonObject> requestBody = Object; // BuiltMap<String, JsonObject> | 
final int roomId = 56; // int | 

try { 
    api.updateGroup(type, requestBody, roomId);
} catch on DioError (e) {
    print('Exception when calling DeviceApi->updateGroup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  | 
 **requestBody** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md)|  | 
 **roomId** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

