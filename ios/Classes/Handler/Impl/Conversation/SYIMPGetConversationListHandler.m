//
//  SYIMPGetConversationListHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPGetConversationListHandler.h"
#import "SyImSdkPlugin.h"
#import <SYIM/SYIM.h>
#import <MJExtension/MJExtension.h>

@implementation SYIMPGetConversationListHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSArray *conversationList = [[SYIMManager shared].conversationManager getConversationList];
    result([conversationList mj_JSONString]);
}
@end
