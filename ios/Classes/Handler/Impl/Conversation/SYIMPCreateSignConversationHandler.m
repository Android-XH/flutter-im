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
                FlutterError *error = [FlutterError errorWithCode:@"500" message:@"创建会话失败" details:nil];
                result(error);
            }
        }];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"uuid 不能为空" details:nil];
        result(error);
    }
}
@end
