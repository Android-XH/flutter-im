//
//  SYIMPIsFriendHandler.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/11.
//

#import "SYIMPIsFriendHandler.h"

@implementation SYIMPIsFriendHandler

- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *userId;
    if ([[optionsMap allKeys] containsObject:@"userId"]) {
        userId = optionsMap[@"userId"];
    }
    if (!IsStringNull(userId)) {
        BOOL isFriend = [[SYIMManager shared].contactManager isFriendWithOutUserId:userId];
        result([NSNumber numberWithBool:isFriend]);
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"userId or remark is null!" details:nil];
        result(error);
    }
}

@end
