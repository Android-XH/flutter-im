//
//  SYIMPDeleteMessageHandler.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/8.
//

#import "SYIMPDeleteMessageHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>
@implementation SYIMPDeleteMessageHandler

// 删除消息
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *msgId;
    if ([[optionsMap allKeys] containsObject:@"msgId"]) {
        msgId = optionsMap[@"msgId"];
    }
    NSString *sessionId;
    if ([[optionsMap allKeys] containsObject:@"sessionId"]) {
        sessionId = optionsMap[@"sessionId"];
    }
    if (!IsStringNull(msgId) && !IsStringNull(sessionId)) {
        NSString *msgId = optionsMap[@"msgId"];
        NSString *sessionId = optionsMap[@"sessionId"];
       BOOL isSuccess = [[SYIMManager shared].chatManager deleteMessageWithMsgId:msgId sessionId:sessionId];
        if (isSuccess) {
            result([NSNumber numberWithBool:isSuccess]);
        } else {
            FlutterError *error = [FlutterError errorWithCode:@"500" message:@"deleteMessage Fail" details:nil];
            result(error);
        }
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"msgId or sessionId is null!" details:nil];
        result(error);
    }
}

@end
