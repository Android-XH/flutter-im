//
//  SYIMPCreateSignConversationHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPCreateSignConversationHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>

@implementation SYIMPCreateSignConversationHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *map = call.arguments;
    NSString *uuid = map[@"uuid"];
    if (uuid) {
        [[SYIMManager shared].conversationManager createPrivateConversationWithOutUserId:uuid complete:^(SYIMConversation * _Nonnull conversation) {
            if (conversation) {
                result([conversation mj_JSONString]);
            } else {
                result(@"创建会话失败");
            }
        }];
    } else {
        result(@"uuid must not be null!");
    }
}
@end
