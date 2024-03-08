//
//  SYIMPDeleteMessageHandle.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/8.
//

#import "SYIMPDeleteMessageHandle.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>
@implementation SYIMPDeleteMessageHandle

// 删除消息
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    if ([[optionsMap allKeys] containsObject:@"msgId"] && [[optionsMap allKeys] containsObject:@"sessionId"]) {
    } else {
        result(@"syMessage is null!");
    }
}

@end
