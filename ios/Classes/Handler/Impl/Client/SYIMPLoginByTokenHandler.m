//
//  SYIMPLoginByTokenHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPLoginByTokenHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>

@implementation SYIMPLoginByTokenHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *map = call.arguments;
    NSString *token = map[@"token"];
    if (token) {
        [[SYIMManager shared].sessionManager loginWithOutUserId:nil token:token complete:^(SYIMAuthInfo * _Nullable authInfo) {
            if (authInfo) {
                result([authInfo mj_JSONString]);
                [[SYIMManager shared].conversationManager addConversationDelegate:SyImSdkPlugin.shared];
                [[SYIMManager shared].chatManager addMessageDelegate:SyImSdkPlugin.shared];
            } else {
                result(@"login failed");
            }
        }];
    } else {
        result(@"token must not be null!");
    }
}
@end
