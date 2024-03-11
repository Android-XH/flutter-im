//
//  SYIMPDeleteFriendHandler.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/11.
//

#import "SYIMPDeleteFriendHandler.h"

@implementation SYIMPDeleteFriendHandler
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *userId;
    if ([[optionsMap allKeys] containsObject:@"userId"]) {
        userId = optionsMap[@"userId"];
    }
    if (!IsStringNull(userId)) {
        [[SYIMManager shared].contactManager deleteContactFriendWithFriendOutId:optionsMap[@"userId"] complete:^(BOOL isSuccess) {
            if (isSuccess) {
                result([NSNumber numberWithBool:isSuccess]);
            } else {
                FlutterError *flutterError = [FlutterError errorWithCode:@"500" message:@"delete friend fail" details:nil];
                result(flutterError);
            }
        }];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"userId is null!" details:nil];
        result(error);
    }
}
@end
