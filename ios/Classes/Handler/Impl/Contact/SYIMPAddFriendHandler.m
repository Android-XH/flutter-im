//
//  SYIMPAddFriendHandler.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/11.
//

#import "SYIMPAddFriendHandler.h"

@implementation SYIMPAddFriendHandler

- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *userId;
    if ([[optionsMap allKeys] containsObject:@"userId"]) {
        userId = optionsMap[@"userId"];
    }
    if (!IsStringNull(userId)) {
        [[SYIMManager shared].contactManager addContactFriendWithFriendOutId:optionsMap[@"userId"] message:@"" type:1 complete:^(BOOL isSuccess, NSError * _Nonnull error) {
            if (isSuccess) {
                result([NSNumber numberWithBool:isSuccess]);
            } else {
                FlutterError *flutterError = [FlutterError errorWithCode:[NSString stringWithFormat:@"%ld",error.code] message:error.domain details:nil];
                result(flutterError);
            }
        }];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"userId is null!" details:nil];
        result(error);
    }
}

@end
