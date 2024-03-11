//
//  SYIMPGetUserInfoHandler.m
//  AFNetworking
//
//  Created by sunchenglei on 2024/3/11.
//

#import "SYIMPGetUserInfoHandler.h"

@implementation SYIMPGetUserInfoHandler

- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *userId;
    if ([[optionsMap allKeys] containsObject:@"userId"]) {
        userId = optionsMap[@"userId"];
    }
    if (!IsStringNull(userId)) {
        [[SYIMManager shared].contactManager getUserInfoWithOutUserId:optionsMap[@"userId"] complete:^(SYIMContact * _Nonnull userInfo) {
            if (userInfo) {
                result([userInfo mj_JSONObject]);
            } else {
                FlutterError *error = [FlutterError errorWithCode:@"500" message:@"get userInfo fail" details:nil];
                result(error);
            }
        }];
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"userId is null!" details:nil];
        result(error);
    }
}

@end
