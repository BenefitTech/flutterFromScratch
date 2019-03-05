#import "IiPluginPackagePlugin.h"
#import <ii_plugin_package/ii_plugin_package-Swift.h>

@implementation IiPluginPackagePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIiPluginPackagePlugin registerWithRegistrar:registrar];
}
@end
