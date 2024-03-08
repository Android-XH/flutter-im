//
//  SYIMPGetAllUnReadNumHandler.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/8.
//

#import "SYIMPGetAllUnReadNumHandler.h"

@implementation SYIMPGetAllUnReadNumHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *map = call.arguments;
    NSString *sessionType = map[@"sessionType"];
    if (sessionType) {
        NSInteger allUnReadCount = [[SYIMManager shared].conversationManager getAllUnReadCountWithSessionType:[sessionType integerValue]];
        result(@(allUnReadCount));
    } else {
        NSInteger allUnReadCount = [[SYIMManager shared].conversationManager getAllUnReadCount];
        result(@(allUnReadCount));
    }
}
@end
