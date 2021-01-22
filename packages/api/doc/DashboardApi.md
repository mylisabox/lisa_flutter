# lisa_server_sdk.api.DashboardApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDashboard**](DashboardApi.md#getDashboard) | **get** /api/v1/dashboard/room/{roomId} | 
[**saveDashboard**](DashboardApi.md#saveDashboard) | **post** /api/v1/dashboard/room/{roomId} | 


# **getDashboard**
> Dashboard getDashboard(roomId)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new DashboardApi();
var roomId = 56; // int | 

try { 
    var result = api_instance.getDashboard(roomId);
    print(result);
} catch (e) {
    print('Exception when calling DashboardApi->getDashboard: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **int**|  | 

### Return type

[**Dashboard**](Dashboard.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveDashboard**
> saveDashboard(roomId, requestBody)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new DashboardApi();
var roomId = 56; // int | 
var requestBody = [new BuiltList<int>()]; // BuiltList<int> | 

try { 
    api_instance.saveDashboard(roomId, requestBody);
} catch (e) {
    print('Exception when calling DashboardApi->saveDashboard: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **int**|  | 
 **requestBody** | [**BuiltList<int>**](int.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

