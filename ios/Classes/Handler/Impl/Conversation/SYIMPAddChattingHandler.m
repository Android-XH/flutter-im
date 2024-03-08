//
//  SYIMPAddChattingHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/8.
//

#import "SYIMPAddChattingHandler.h"

@implementation SYIMPAddChattingHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *map = call.arguments;
    NSString *sessionId = map[@"sessionId"];
    if (sessionId) {
        [[SYIMManager shared].conversationManager addChattingWithSessionId:sessionId];
        result(@"addChatting success");
    }
}
@end
