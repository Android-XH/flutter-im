//
//  SYIMPSetConversationToppingHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/8.
//

#import "SYIMPSetConversationToppingHandler.h"

@implementation SYIMPSetConversationToppingHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *map = call.arguments;
    NSString *sessionId = map[@"sessionId"];
    BOOL topping = [map[@"topping"] boolValue];
    if (sessionId) {
        [[SYIMManager shared].conversationManager setConversationToppingWithSessionId:sessionId isTop:topping complete:^(BOOL isSuccess) {
            result(@(isSuccess));
        }];
    }
}
@end
