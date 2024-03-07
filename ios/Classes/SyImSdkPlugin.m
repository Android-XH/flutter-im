#import "SyImSdkPlugin.h"
#import "SYIMPChannelCommon.h"
#import "SYIMPMethodCommon.h"
#import "SYIMPConnectData.h"
#import <MJExtension/MJExtension.h>

@interface SyImSdkPlugin ()

@property(nonatomic, strong) FlutterMethodChannel *methodChannel;

@property(nonatomic, strong) FlutterBasicMessageChannel *connectChannel;

@end

@implementation SyImSdkPlugin
+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static SyImSdkPlugin *sInstance;
    dispatch_once(&onceToken, ^{
        sInstance = [[SyImSdkPlugin alloc] init];
    });
    return sInstance;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    SyImSdkPlugin.shared.methodChannel = [FlutterMethodChannel methodChannelWithName:SY_SDK_METHOD_CHANNEL binaryMessenger:registrar.messenger];
    [registrar addMethodCallDelegate:SyImSdkPlugin.shared channel:SyImSdkPlugin.shared.methodChannel];
    SyImSdkPlugin.shared.connectChannel = [FlutterBasicMessageChannel messageChannelWithName:SY_SDK_CONNECT_CHANNEL binaryMessenger:registrar.messenger codec:FlutterStringCodec.sharedInstance];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([SY_CLIENT_INIT isEqualToString:call.method]) {
        
        result(@"sdk init success");
    } else if ([SY_CLIENT_LOGIN_BY_TOKEN isEqualToString:call.method]) {
        result(@"");
    } else if ([SY_CLIENT_LOGIN_BY_ACCOUNT_ID isEqualToString:call.method]) {
        result(@"");
    } else if ([SY_CLIENT_LOGOUT isEqualToString:call.method]) {
        result(@"");
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)detachFromEngineForRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    [self.methodChannel setMethodCallHandler:nil];
}

- (void)postDataWithType:(NSString *)type code:(NSInteger)code msg:(NSString *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        SYIMPConnectData *connectData = [[SYIMPConnectData alloc] init];
        connectData.type = type;
        connectData.code = code;
        connectData.msg = msg;
        [self.connectChannel sendMessage:[connectData mj_JSONString]];
    });
}
@end
