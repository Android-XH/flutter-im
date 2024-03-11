//
//  SYIMPSendMessageHandler.m
//  AFNetworking
//
//  Created by sunchenglei on 2024/3/8.
//

#import "SYIMPSendMessageHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>

@implementation SYIMPSendMessageHandler
// 发送消息
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *optionsJson = optionsMap[@"syMessage"];
    if (optionsJson) {
        SYIMMessage *message = [SYIMMessage mj_objectWithKeyValues:optionsJson];
        [[SYIMManager shared].chatManager sendMessage:message callBack:^(SYIMMessage * _Nonnull msgModel, NSString * _Nonnull errorDes) {
            if (errorDes.length > 0) {
                FlutterError *error = [FlutterError errorWithCode:@"500" message:errorDes details:nil];
                result(error);
            } else {
                result([msgModel mj_JSONString]);
            }
        }];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"syMessage is null!" details:nil];
        result(error);
    }
}

@end
