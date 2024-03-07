//
//  SYIMPConnectData.h
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYIMPConnectData : NSObject

@property(nonatomic, copy) NSString *type;
@property(nonatomic, assign) NSInteger code;
@property(nonatomic, copy) NSString *msg;

@end

NS_ASSUME_NONNULL_END
