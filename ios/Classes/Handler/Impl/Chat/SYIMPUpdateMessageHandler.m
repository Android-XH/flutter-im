//
//  SYIMPUpdateMessageHandler.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/8.
//

#import "SYIMPUpdateMessageHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>
@implementation SYIMPUpdateMessageHandler
// 更新消息
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *optionsJson = optionsMap[@"syMessage"];
    if (optionsJson) {
        SYIMMessage *message = [SYIMMessage mj_objectWithKeyValues:optionsJson];
        [[SYIMManager shared].chatManager updateMessage:message callBack:^(NSError * _Nonnull error) {
            if (error) {
                result(error.domain);
            } else {
                result([message mj_JSONString]);
            }
        }];
    } else {
        result(@"syMessage is null!");
    }
}
@end
