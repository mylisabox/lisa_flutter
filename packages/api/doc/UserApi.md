# lisa_server_sdk.api.UserApi

## Load the API package
```dart
import 'package:lisa_server_sdk/api.dart';
```

All URIs are relative to *http://mylisabox:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getProfile**](UserApi.md#getprofile) | **GET** /api/v1/users/me | 
[**saveProfile**](UserApi.md#saveprofile) | **PATCH** /api/v1/users/me | 


# **getProfile**
> User getProfile()



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getUserApi();

try { 
    final response = api.getProfile();
    print(response);
} catch on DioError (e) {
    print('Exception when calling UserApi->getProfile: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**User**](User.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveProfile**
> User saveProfile(email, firstName, lang, lastName, mobile, password, avatar)



### Example 
```dart
import 'package:lisa_server_sdk/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = LisaServerSdk().getUserApi();
final String email = ; // String | 
final String firstName = firstName_example; // String | 
final String lang = lang_example; // String | 
final String lastName = lastName_example; // String | 
final String mobile = mobile_example; // String | 
final String password = password_example; // String | 
final MultipartFile avatar = BINARY_DATA_HERE; // MultipartFile | 

try { 
    final response = api.saveProfile(email, firstName, lang, lastName, mobile, password, avatar);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UserApi->saveProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | [**String**](String.md)|  | [optional] 
 **firstName** | **String**|  | [optional] 
 **lang** | **String**|  | [optional] 
 **lastName** | **String**|  | [optional] 
 **mobile** | **String**|  | [optional] 
 **password** | **String**|  | [optional] 
 **avatar** | **MultipartFile**|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

