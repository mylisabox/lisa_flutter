# lisa_server_sdk.api.ConfigApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**isInitialized**](ConfigApi.md#isInitialized) | **get** /api/v1/initialized | 


# **isInitialized**
> IsInitialized isInitialized()



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

var api_instance = new ConfigApi();

try { 
    var result = api_instance.isInitialized();
    print(result);
} catch (e) {
    print('Exception when calling ConfigApi->isInitialized: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**IsInitialized**](IsInitialized.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

