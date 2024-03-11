//
//  SYIMPGetMessageHandler.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/8.
//

#import "SYIMPGetMessageHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>
@implementation SYIMPGetMessageHandler

// 查询某条消息
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
        SYIMMessage *message= [[SYIMManager shared].chatManager getMessageWithMessageId:msgId sessionId:sessionId];
        if (message) {
            result([message mj_JSONString]);
        } else {
            FlutterError *error = [FlutterError errorWithCode:@"500" message:@"getMessage error" details:nil];
            result(error);
        }
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"msgId or sessionId is null!" details:nil];
        result(error);
    }
}

@end
