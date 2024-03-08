//
//  SYIMPAddConnectListenerHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPAddConnectListenerHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>

@implementation SYIMPAddConnectListenerHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    [[SYIMManager shared].sessionManager appendConnectHandler:SyImSdkPlugin.shared];
}
@end
