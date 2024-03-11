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
    
    NSString *optionsJson;
    if ([[optionsMap allKeys] containsObject:@"syMessage"]) {
        optionsJson = optionsMap[@"syMessage"];
    }
    NSInteger pageSize= 0;
    if ([[optionsMap allKeys] containsObject:@"pageSize"]) {
        pageSize = [optionsMap[@"pageSize"] integerValue];
    }
    if (!IsStringNull(optionsJson)) {
        SYIMMessage *message = [SYIMMessage mj_objectWithKeyValues:optionsJson];
        NSArray <SYIMMessage *> *messageList =  [[SYIMManager shared].chatManager getMessageList:message pageSize:pageSize > 0 ? pageSize : 20];
        result([[SYIMMessage mj_keyValuesArrayWithObjectArray:messageList] mj_JSONString]);
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"syMessage is null!" details:nil];
        result(error);
    }
}

@end
