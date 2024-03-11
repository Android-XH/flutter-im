//
//  SYIMPSaveMessageToLocalHandler.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/8.
//

#import "SYIMPSaveMessageToLocalHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>
@implementation SYIMPSaveMessageToLocalHandler
// 保存消息到本地，不发到服务器
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *optionsJson = optionsMap[@"syMessage"];
    if (optionsJson) {
        SYIMMessage *message = [SYIMMessage mj_objectWithKeyValues:optionsJson];
        [[SYIMManager shared].chatManager saveMessageToLocal:message isUpdateConversation:NO];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"syMessage is null!" details:nil];
        result(error);
    }
}

@end
