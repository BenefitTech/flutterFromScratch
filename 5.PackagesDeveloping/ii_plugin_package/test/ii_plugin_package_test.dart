import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ii_plugin_package/ii_plugin_package.dart';

void main() {
  const MethodChannel channel = MethodChannel('ii_plugin_package');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await IiPluginPackage.platformVersion, '42');
  });
}
