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
    if ([[optionsMap allKeys] containsObject:@"msgId"] && [[optionsMap allKeys] containsObject:@"sessionId"]) {
        NSString *msgId = optionsMap[@"msgId"];
        NSString *sessionId = optionsMap[@"sessionId"];
        SYIMMessage *message= [[SYIMManager shared].chatManager getMessageWithMessageId:msgId sessionId:sessionId];
        if (message) {
            result([message mj_JSONString]);
        } else {
            result(@"getMessage error");
        }
    } else {
        result(@"msgId or sessionId is null!");
    }
}

@end
