import 'dart:async';

import 'package:flutter/services.dart';

class IiPluginPackage {
  static const MethodChannel _channel =
      const MethodChannel('ii_plugin_package');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
