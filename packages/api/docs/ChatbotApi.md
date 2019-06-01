# lisa_server_sdk.api.ChatbotApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**interact**](ChatbotApi.md#interact) | **Post** /api/v1/chatbot/interact | 


# **interact**
> InteractResponse interact(interactRequest)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new ChatbotApi();
var interactRequest = new InteractRequest(); // InteractRequest | 

try { 
    var result = api_instance.interact(interactRequest);
    print(result);
} catch (e) {
    print("Exception when calling ChatbotApi->interact: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **interactRequest** | [**InteractRequest**](InteractRequest.md)|  | [optional] 

### Return type

[**InteractResponse**](InteractResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

