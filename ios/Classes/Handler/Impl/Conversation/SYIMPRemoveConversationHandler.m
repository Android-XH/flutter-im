//
//  SYIMPRemoveConversationHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/8.
//

#import "SYIMPRemoveConversationHandler.h"

@implementation SYIMPRemoveConversationHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *map = call.arguments;
    NSString *sessionId = map[@"sessionId"];
    if (sessionId) {
        [[SYIMManager shared].conversationManager removeConversationWithSessionId:sessionId complete:^(BOOL isSuccess) {
            if (isSuccess) {
                result(@(isSuccess));
            }
        }];;
    }
}
@end
