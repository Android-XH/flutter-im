#import <Flutter/Flutter.h>
#import <SYIM/SYIM.h>

@interface SyImSdkPlugin : NSObject <
FlutterPlugin,
SYIMConnectHandler,
SYIMLoginResultHandler,
SYIMConversationDelegate,
SYIMMessageHandler>

+ (instancetype)shared;
@end
