#import "FlutterTtsImprovedPlugin.h"
#import <flutter_tts_improved/flutter_tts_improved-Swift.h>

@implementation FlutterTtsImprovedPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterTtsImprovedPlugin registerWithRegistrar:registrar];
}
@end
