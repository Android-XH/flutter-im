//
//  SYIMPMessageData.h
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYIMPMessageData : NSObject

@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *data;

@end

NS_ASSUME_NONNULL_END
