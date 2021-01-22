//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import connectivity_macos
import file_chooser
import flutter_blue
import flutter_speech
import package_info
import path_provider_macos
import shared_preferences_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  ConnectivityPlugin.register(with: registry.registrar(forPlugin: "ConnectivityPlugin"))
  FileChooserPlugin.register(with: registry.registrar(forPlugin: "FileChooserPlugin"))
  FlutterBluePlugin.register(with: registry.registrar(forPlugin: "FlutterBluePlugin"))
  FlutterSpeechRecognitionPlugin.register(with: registry.registrar(forPlugin: "FlutterSpeechRecognitionPlugin"))
  FLTPackageInfoPlugin.register(with: registry.registrar(forPlugin: "FLTPackageInfoPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
}
