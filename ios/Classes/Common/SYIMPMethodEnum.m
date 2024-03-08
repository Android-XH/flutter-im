//
//  SYIMPMethodEnum.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPMethodEnum.h"
#import "SYIMPClientInitHandler.h"
#import "SYIMPAddConnectListenerHandler.h"
#import "SYIMPLoginByTokenHandler.h"
#import "SYIMPLoginByUuidHandler.h"
#import "SYIMPLogOutHandler.h"
#import "SYIMPCreateSignConversationHandler.h"
#import "SYIMPGetConversationListHandler.h"
// 消息
#import "SYIMPSendMessageHandler.h"
#import "SYIMPSaveMessageToLocalHandler.h"
#import "SYIMPGetMessageListHandle.h"
#import "SYIMPDeleteMessageHandle.h"

@implementation SYIMPMethodEnum

+ (instancetype)enumWithMethodName:(NSString *)methodName methodHandler:(id<SYIMPMethodHandler>)methodHandler {
    SYIMPMethodEnum *methodEnum = [[SYIMPMethodEnum alloc] init];
    methodEnum.methodName = methodName;
    methodEnum.methodHandler = methodHandler;
    return methodEnum;
}

static NSArray<SYIMPMethodEnum *> *values = nil;
+ (NSArray<SYIMPMethodEnum *> *)getValues {
    if (values == nil) {
        values = @[
            [SYIMPMethodEnum enumWithMethodName:@"init" methodHandler:SYIMPClientInitHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"loginByToken" methodHandler:SYIMPLoginByTokenHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"loginByAccountId" methodHandler:SYIMPLoginByUuidHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"logOut" methodHandler:SYIMPLogOutHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"addConnectListener" methodHandler:SYIMPAddConnectListenerHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"getConversationList" methodHandler:SYIMPGetConversationListHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"createSignConversation" methodHandler:SYIMPCreateSignConversationHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"sendMessage" methodHandler:SYIMPSendMessageHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"saveMessageToLocal" methodHandler:SYIMPSaveMessageToLocalHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"getMessageList" methodHandler:SYIMPGetMessageListHandle.new],
            [SYIMPMethodEnum enumWithMethodName:@"deleteMessage" methodHandler:SYIMPDeleteMessageHandle.new],
        ];
    }
    return values;
}
@end
