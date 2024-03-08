#import "SyImSdkPlugin.h"
#import "SYIMPChannelCommon.h"
#import "SYIMPMethodCommon.h"
#import "SYIMPConnectData.h"
#import "SYIMPMethodHandler.h"
#import "SYIMPMethodEnum.h"
#import "SYIMPMessageData.h"

#import <MJExtension/MJExtension.h>

@interface SyImSdkPlugin ()

@property(nonatomic, strong) FlutterMethodChannel *methodChannel;

@property(nonatomic, strong) FlutterBasicMessageChannel *connectChannel;

@property(nonatomic, strong) FlutterBasicMessageChannel *conversationChannel;

@property(nonatomic, strong) FlutterBasicMessageChannel *chatMessageChannel;

@property(nonatomic, strong) NSMutableDictionary<NSString *, id<SYIMPMethodHandler>> *methodHandlerHashMap;

@end

@implementation SyImSdkPlugin
+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static SyImSdkPlugin *sInstance;
    dispatch_once(&onceToken, ^{
        sInstance = [[SyImSdkPlugin alloc] init];
    });
    return sInstance;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    SyImSdkPlugin.shared.methodChannel = [FlutterMethodChannel methodChannelWithName:SY_SDK_METHOD_CHANNEL binaryMessenger:registrar.messenger];
    [registrar addMethodCallDelegate:SyImSdkPlugin.shared channel:SyImSdkPlugin.shared.methodChannel];
    SyImSdkPlugin.shared.connectChannel = [FlutterBasicMessageChannel messageChannelWithName:SY_SDK_CONNECT_CHANNEL binaryMessenger:registrar.messenger codec:FlutterStringCodec.sharedInstance];
    SyImSdkPlugin.shared.conversationChannel = [FlutterBasicMessageChannel messageChannelWithName:SY_CLIENT_CONVERSATION_CHANNEL binaryMessenger:registrar.messenger codec:FlutterStringCodec.sharedInstance];
    SyImSdkPlugin.shared.chatMessageChannel = [FlutterBasicMessageChannel messageChannelWithName:SY_CLIENT_CHAT_MESSAGE_CHANNEL binaryMessenger:registrar.messenger codec:FlutterStringCodec.sharedInstance];
    SyImSdkPlugin.shared.methodHandlerHashMap = [NSMutableDictionary dictionary];
    for (SYIMPMethodEnum *methodEnum in SYIMPMethodEnum.getValues) {
        SyImSdkPlugin.shared.methodHandlerHashMap[methodEnum.methodName] = methodEnum.methodHandler;
    }
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString *method = call.method;
    if (method == nil) return;
    id<SYIMPMethodHandler> methodHandler = self.methodHandlerHashMap[method];
    if (methodHandler != nil) {
        [methodHandler onMethodCall:call result:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)detachFromEngineForRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    [self.methodChannel setMethodCallHandler:nil];
}

- (void)postConnectDataWithType:(NSString *)type code:(NSInteger)code msg:(NSString *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        SYIMPConnectData *connectData = [[SYIMPConnectData alloc] init];
        connectData.type = type;
        connectData.code = code;
        connectData.msg = msg;
        [self.connectChannel sendMessage:[connectData mj_JSONString]];
    });
}

- (void)postConversationData:(NSArray<SYIMConversation *> *)list {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *jsonString = [[SYIMConversation mj_keyValuesArrayWithObjectArray:list] mj_JSONString];
        [self.conversationChannel sendMessage:jsonString];
    });
}

- (void)postChatMessageData:(SYIMPMessageData *)messageData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.chatMessageChannel sendMessage:[messageData mj_JSONString]];
    });
}


#pragma mark - Delegate
- (void)onConnectStatusChanged:(SYIMSocketClientConnectState)status {
    if (status == SYSocketClientConnectState_Connected) {
        [self postConnectDataWithType:@"CONNECT_FAIL" code:500 msg:@"断开连接"];
    } else {
        [self postConnectDataWithType:@"CONNECT_SUCCESS" code:200 msg:@"连接成功"];
    }
}

- (void)onLoginResultChanged:(SYIMLoginResult)status {
    
    switch (status) {
        case SYLoginResult_Success: {
            NSString *authInfoString = [[SYIMManager shared].sessionManager.authInfo mj_JSONString];
            [self postConnectDataWithType:@"AUTH_SUCCESS" code:200 msg:authInfoString];
            break;
        }
        case SYLoginResult_Fail: {
            [self postConnectDataWithType:@"AUTH_FAIL" code:500 msg:@"token 失效 需要重新登录"];
            break;
        }
        case SYLoginResult_ForceOffline: {
            [self postConnectDataWithType:@"FORCED_OFFLINE" code:500 msg:@"被挤下线 重复登录"];
            break;
        }
        case SYLoginResult_Restricted: {
            [self postConnectDataWithType:@"FORCED_OFFLINE" code:501 msg:@"服务端强制下线"];
            
            break;
        }
        default:
            break;
    }
}

/// 会话列表变更
/// - Parameter conversationList: 会话列表
- (void)onConversationListChanged:(NSArray<SYIMConversation *> *)conversationList {
    [self postConversationData:conversationList];
}


- (void)onStatusChange:(SYIMMessage *)message {
    SYIMPMessageData *messageData = [[SYIMPMessageData alloc] init];
    messageData.type = @"onStatusChange";
    messageData.data = [[SYIMMessage mj_keyValuesArrayWithObjectArray:@[message]] mj_JSONString];
    [self postChatMessageData:messageData];
}

/**
 *  发消息回执
 *  @param message 发消息回执
 *  @param error   失败
 */
- (void)sendMessageReceipt:(SYIMMessage *)message error:(nullable NSError *)error {
    
}

/**
 *  消息
 *  @param messages 收到消息数组
 */
- (void)onMessages:(NSArray <SYIMMessage *> *)messages {
    for (SYIMMessage *message in messages) {
        SYIMPMessageData *messageData = [[SYIMPMessageData alloc] init];
        messageData.data = [message mj_JSONString];
        if (message.messageBody.type == SYIMMessageTypeCustom) {
            messageData.type = @"onCustomMsg";
            [self postChatMessageData:messageData];
        }
        messageData.type = @"onMessage";
        [self postChatMessageData:messageData];
    }
}

- (void)onCmdMsg:(SYIMMessage *)message {
    SYIMPMessageData *messageData = [[SYIMPMessageData alloc] init];
    messageData.data = [message mj_JSONString];
    messageData.type = @"onCmdMsg";
    [self postChatMessageData:messageData];
}

/**
 *  撤回消息
 *  @param message 消息
 */
- (void)onWithdrawMsg:(SYIMMessage *)message {
    
}

@end
