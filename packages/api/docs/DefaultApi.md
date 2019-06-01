# lisa_server_sdk.api.DefaultApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://mylisabox:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteScene**](DefaultApi.md#deleteScene) | **Delete** /api/v1/chatbot/userBot/:scene | 


# **deleteScene**
> deleteScene(scene)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new DefaultApi();
var scene = scene_example; // String | 

try { 
    api_instance.deleteScene(scene);
} catch (e) {
    print("Exception when calling DefaultApi->deleteScene: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scene** | **String**|  | [default to null]

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

