# lisa_server_sdk.api.SetupApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**setupVoiceCommands**](SetupApi.md#setupVoiceCommands) | **Post** /api/v1/setup/voice_commands | 


# **setupVoiceCommands**
> setupVoiceCommands(config)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new SetupApi();
var config = BINARY_DATA_HERE; // MultipartFile | 

try { 
    api_instance.setupVoiceCommands(config);
} catch (e) {
    print("Exception when calling SetupApi->setupVoiceCommands: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **config** | **MultipartFile****MultipartFile**|  | [optional] [default to null]

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

