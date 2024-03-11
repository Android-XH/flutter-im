//
//  SYIMPLogOutHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPLogOutHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>
@implementation SYIMPLogOutHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    [[SYIMManager shared].sessionManager logoutWithComplete:^(BOOL isSuccess) {
        if (isSuccess) {
            result(@"退出登录成功");
        } else {
            FlutterError *error = [FlutterError errorWithCode:@"500" message:@"退出登录失败" details:nil];
            result(error);
        }
        
    }];
}
@end
