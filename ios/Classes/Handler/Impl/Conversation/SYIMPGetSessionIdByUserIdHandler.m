//
//  SYIMPGetSessionIdByUserIdHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/8.
//

#import "SYIMPGetSessionIdByUserIdHandler.h"

@implementation SYIMPGetSessionIdByUserIdHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *map = call.arguments;
    NSString *uuid = map[@"userId"];
    if (uuid) {
        [[SYIMManager shared].conversationManager createPrivateConversationWithOutUserId:uuid complete:^(SYIMConversation * _Nonnull conversation) {
            if (conversation) {
                result(conversation.sessionId);
            }
        }];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"uuid 不能为空" details:nil];
        result(error);
    }
}
@end
