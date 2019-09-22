# lisa_server_sdk.api.LoginApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**login**](LoginApi.md#login) | **Post** /api/v1/auth/local | 
[**logout**](LoginApi.md#logout) | **Get** /api/v1/auth/logout | 
[**register**](LoginApi.md#register) | **Post** /api/v1/auth/local/register | 


# **login**
> LoginResponse login(loginRequest)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';

var api_instance = new LoginApi();
var loginRequest = new LoginRequest(); // LoginRequest | 

try { 
    var result = api_instance.login(loginRequest);
    print(result);
} catch (e) {
    print("Exception when calling LoginApi->login: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | [optional] 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logout**
> logout()



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//lisa_server_sdk.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//lisa_server_sdk.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LoginApi();

try { 
    api_instance.logout();
} catch (e) {
    print("Exception when calling LoginApi->logout: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **register**
> LoginResponse register(loginRequest)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';

var api_instance = new LoginApi();
var loginRequest = new LoginRequest(); // LoginRequest | 

try { 
    var result = api_instance.register(loginRequest);
    print(result);
} catch (e) {
    print("Exception when calling LoginApi->register: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | [optional] 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

