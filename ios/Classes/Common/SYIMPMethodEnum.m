//
//  SYIMPMethodEnum.m
//  sy_im_sdk
//
//  Created by 张国梁 on 2024/3/7.
//

#import "SYIMPMethodEnum.h"
// 连接 登录
#import "SYIMPClientInitHandler.h"
#import "SYIMPAddConnectListenerHandler.h"
#import "SYIMPLoginByTokenHandler.h"
#import "SYIMPLoginByUuidHandler.h"
#import "SYIMPLogOutHandler.h"
// 会话
#import "SYIMPCreateSignConversationHandler.h"
#import "SYIMPGetConversationListHandler.h"
#import "SYIMPAddChattingHandler.h"
#import "SYIMPGetAllUnReadNumHandler.h"
#import "SYIMPGetSessionIdByUserIdHandler.h"
#import "SYIMPGetUnReadNumHandler.h"
#import "SYIMPRemoveChattingHandler.h"
#import "SYIMPRemoveConversationHandler.h"
#import "SYIMPRestUnReadCountHandler.h"
#import "SYIMPSetConversationToppingHandler.h"
// 消息
#import "SYIMPSendMessageHandler.h"
#import "SYIMPSaveMessageToLocalHandler.h"
#import "SYIMPGetMessageListHandle.h"
#import "SYIMPDeleteMessageHandler.h"
#import "SYIMPUpdateMessageHandler.h"
#import "SYIMPGetMessageHandler.h"
// 联系人
#import "SYIMPGetUserInfoHandler.h"
#import "SYIMPGetUserInfoFromCacheHandler.h"
#import "SYIMPAddFriendHandler.h"
#import "SYIMPDeleteFriendHandler.h"
#import "SYIMPEditFriendRemarkHandler.h"
#import "SYIMPIsFriendHandler.h"
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
            // 初始化 登录相关
            [SYIMPMethodEnum enumWithMethodName:@"init" methodHandler:SYIMPClientInitHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"loginByToken" methodHandler:SYIMPLoginByTokenHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"loginByAccountId" methodHandler:SYIMPLoginByUuidHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"logOut" methodHandler:SYIMPLogOutHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"addConnectListener" methodHandler:SYIMPAddConnectListenerHandler.new],
            
            // 会话相关
            [SYIMPMethodEnum enumWithMethodName:@"getConversationList" methodHandler:SYIMPGetConversationListHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"createSignConversation" methodHandler:SYIMPCreateSignConversationHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"addChatting" methodHandler:SYIMPAddChattingHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"getAllUnReadNum" methodHandler:SYIMPGetAllUnReadNumHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"getSessionIdByUserId" methodHandler:SYIMPGetSessionIdByUserIdHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"getUnReadNum" methodHandler:SYIMPGetUnReadNumHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"removeChatting" methodHandler:SYIMPRemoveChattingHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"removeConversation" methodHandler:SYIMPRemoveConversationHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"restUnReadCount" methodHandler:SYIMPRestUnReadCountHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"setConversationTopping" methodHandler:SYIMPSetConversationToppingHandler.new],
            
            // 消息相关
            [SYIMPMethodEnum enumWithMethodName:@"sendMessage" methodHandler:SYIMPSendMessageHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"saveMessageToLocal" methodHandler:SYIMPSaveMessageToLocalHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"getMessageList" methodHandler:SYIMPGetMessageListHandle.new],
            [SYIMPMethodEnum enumWithMethodName:@"deleteMessage" methodHandler:SYIMPDeleteMessageHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"updateMessage" methodHandler:SYIMPUpdateMessageHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"getMessage" methodHandler:SYIMPGetMessageHandler.new],
            
            // 联系人相关
            [SYIMPMethodEnum enumWithMethodName:@"getUserInfo" methodHandler:SYIMPGetUserInfoHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"getUserInfoFromCache" methodHandler:SYIMPGetUserInfoFromCacheHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"addFriend" methodHandler:SYIMPAddFriendHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"deleteFriend" methodHandler:SYIMPDeleteFriendHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"editFriendRemark" methodHandler:SYIMPEditFriendRemarkHandler.new],
            [SYIMPMethodEnum enumWithMethodName:@"isFriend" methodHandler:SYIMPIsFriendHandler.new],
            
        ];
    }
    return values;
}
@end
