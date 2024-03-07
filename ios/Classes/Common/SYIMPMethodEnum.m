//
//  SYIMPMethodEnum.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPMethodEnum.h"

@implementation SYIMPMethodEnum

+ (instancetype)enumWithMethodName:(NSString *)methodName methodHandler:(id<SYIMPMethodHandler>)methodHandler {
    SYIMPMethodEnum *methodEnum = [[SYIMPMethodEnum alloc] init];
    methodEnum.methodName = methodName;
    methodEnum.methodHandler = methodHandler;
    return methodEnum;
}

- (NSArray<SYIMPMethodEnum *> *)getValues {
    return nil;
}
@end
