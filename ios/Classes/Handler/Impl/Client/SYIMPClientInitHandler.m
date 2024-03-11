//
//  SYIMPClientInitHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPClientInitHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>

@implementation SYIMPClientInitHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *optionsJson = optionsMap[@"optionsJson"];
    if (optionsJson) {
        SYIMOptions *options = [SYIMOptions mj_objectWithKeyValues:optionsJson];
        NSString *env = optionsMap[@"environment"];
        if (env) {
            if ([env isEqualToString:@"prod"]) {
                options.env = SYEnvEnumPROD;
            } else {
                options.env = SYEnvEnumDEV;
            }
        }
        [[SYIMManager shared] initSDKWithOptions:options];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"缺少 AppID, AppSecret等必要数据" details:nil];
        result(error);
    }
    [[SYIMManager shared].sessionManager appendConnectHandler:SyImSdkPlugin.shared];
    [[SYIMManager shared].sessionManager appendLoginResultDelegate:SyImSdkPlugin.shared];
}
@end
