//
//  SYIMPEditFriendRemarkHandler.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/11.
//

#import "SYIMPEditFriendRemarkHandler.h"

@implementation SYIMPEditFriendRemarkHandler

- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *userId;
    if ([[optionsMap allKeys] containsObject:@"userId"]) {
        userId = optionsMap[@"userId"];
    }
    NSString *remark;
    if ([[optionsMap allKeys] containsObject:@"remark"]) {
        remark = optionsMap[@"remark"];
    }
    if (!IsStringNull(userId) && !IsStringNull(remark)) {
        [[SYIMManager shared].contactManager updateContactFriendWithFriendOutId:optionsMap[@"userId"] remark:optionsMap[@"remark"] complete:^(BOOL isSuccess) {
            if (isSuccess) {
                result([NSNumber numberWithBool:isSuccess]);
            } else {
                FlutterError *flutterError = [FlutterError errorWithCode:@"500" message:@"edit friend remark fail" details:nil];
                result(flutterError);
            }
        }];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"userId or remark is null!" details:nil];
        result(error);
    }
}

@end
