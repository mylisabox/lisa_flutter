# lisa_server_sdk.model.Device

## Load the model package
```dart
import 'package:lisa_server_sdk/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**roomId** | **int** |  | [optional] 
**grouped** | **bool** |  | [optional] [default to false]
**groupCount** | **int** |  | [optional] [default to 0]
**children** | [**BuiltList&lt;Device&gt;**](Device.md) |  | [optional] 
**name** | **String** |  | 
**defaultAction** | **String** |  | [optional] 
**driver** | **String** |  | [optional] 
**powered** | **bool** |  | 
**imageOn** | **String** |  | [optional] 
**imageOff** | **String** |  | [optional] 
**sortOrder** | **int** |  | 
**pluginName** | **String** |  | 
**type** | [**DeviceTypeEnum**](DeviceTypeEnum.md) |  | 
**template** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md) |  | [optional] 
**data** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md) |  | [optional] 
**favorite** | **bool** |  | [default to false]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


