//
//  SYIMPMethodEnum.h
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import <Foundation/Foundation.h>
#import "SYIMPMethodHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface SYIMPMethodEnum : NSObject

@property(nonatomic, copy) NSString *methodName;
@property(nonatomic, strong) id<SYIMPMethodHandler> methodHandler;

+ (instancetype)enumWithMethodName:(NSString *)methodName methodHandler:(id<SYIMPMethodHandler>)methodHandler;

+ (NSArray<SYIMPMethodEnum *> *)getValues;

@end

NS_ASSUME_NONNULL_END
