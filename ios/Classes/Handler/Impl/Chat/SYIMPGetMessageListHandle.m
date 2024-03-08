//
//  SYIMPGetMessageListHandle.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/8.
//

#import "SYIMPGetMessageListHandle.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>
@implementation SYIMPGetMessageListHandle

// 获取本地消息
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    if ([[optionsMap allKeys] containsObject:@"syMessage"] && [[optionsMap allKeys] containsObject:@"pageSize"]) {
        NSString *optionsJson = optionsMap[@"syMessage"];
        NSInteger pageSize = [optionsMap[@"pageSize"] integerValue];
        SYIMMessage *message = [SYIMMessage mj_objectWithKeyValues:optionsJson];
      NSArray <SYIMMessage *> *messageList =  [[SYIMManager shared].chatManager getMessageList:message pageSize:pageSize > 0 ? pageSize : 20];
        result([[SYIMMessage mj_keyValuesArrayWithObjectArray:messageList] mj_JSONString]);
    } else {
        result(@"syMessage is null!");
    }
}

@end
