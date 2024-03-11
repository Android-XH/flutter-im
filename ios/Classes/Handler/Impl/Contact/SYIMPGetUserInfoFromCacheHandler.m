//
//  SYIMPGetUserInfoFromCacheHandler.m
//  sy_im_sdk
//
//  Created by sunchenglei on 2024/3/11.
//

#import "SYIMPGetUserInfoFromCacheHandler.h"

@implementation SYIMPGetUserInfoFromCacheHandler

- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *optionsMap = call.arguments;
    NSString *userId;
    if ([[optionsMap allKeys] containsObject:@"userId"]) {
        userId = optionsMap[@"userId"];
    }
    if (!IsStringNull(userId)) {
        SYIMContact *contact = [[SYIMManager shared].contactManager getUserInfoWithOutUserId:optionsMap[@"userId"]];
        result([contact mj_JSONObject]);
    } else {
        FlutterError *error = [FlutterError errorWithCode:@"500" message:@"userId is null!" details:nil];
        result(error);
    }
}

@end
