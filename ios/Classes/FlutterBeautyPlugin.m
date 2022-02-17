#import "FlutterBeautyPlugin.h"
#if __has_include(<flutter_beauty/flutter_beauty-Swift.h>)
#import <flutter_beauty/flutter_beauty-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_beauty-Swift.h"
#endif

@implementation FlutterBeautyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterBeautyPlugin registerWithRegistrar:registrar];
}
@end
