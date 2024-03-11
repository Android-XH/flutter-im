//
//  SYIMPLoginByUuidHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPLoginByUuidHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>
@implementation SYIMPLoginByUuidHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *map = call.arguments;
    NSString *uuid = map[@"uuid"];
    if (uuid) {
        [[SYIMManager shared].sessionManager loginWithOutUserId:uuid nickName:nil complete:^(SYIMAuthInfo * _Nullable authInfo) {
            if (authInfo) {
                result([authInfo mj_JSONString]);
                [[SYIMManager shared].conversationManager addConversationDelegate:SyImSdkPlugin.shared];
                [[SYIMManager shared].chatManager addMessageDelegate:SyImSdkPlugin.shared];
            } else {
                FlutterError *error = [FlutterError errorWithCode:@"500" message:@"登录失败" details:nil];
                result(error);
            }
        }];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"uuid must not be null!" details:nil];
        result(error);
    }
}
@end
