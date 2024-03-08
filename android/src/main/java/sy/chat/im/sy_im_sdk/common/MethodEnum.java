package sy.chat.im.sy_im_sdk.common;

import sy.chat.im.sy_im_sdk.handler.MethodHandler;
import sy.chat.im.sy_im_sdk.handler.impl.chat.DeleteMessageHandler;
import sy.chat.im.sy_im_sdk.handler.impl.chat.GetMessageHandler;
import sy.chat.im.sy_im_sdk.handler.impl.chat.GetMessageListHandler;
import sy.chat.im.sy_im_sdk.handler.impl.chat.SaveMessageToLocalHandler;
import sy.chat.im.sy_im_sdk.handler.impl.chat.SendMessageHandler;
import sy.chat.im.sy_im_sdk.handler.impl.chat.UpdateMessageHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.AddConnectListenerHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.LoginByUuidHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.AddChattingHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.GetAllUnReadNumHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.GetConversationListHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.LogOutHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.LoginByTokenHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.SyClientInitHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.CreateSignConversationHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.GetSessionIdByUserIdHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.GetUnReadNumHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.RemoveConversationHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.RestUnReadCountHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.RemoveChattingHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.SetConversationToppingHandler;


public enum MethodEnum {
    //SyClient配置开始
    SY_CLIENT_INIT("init", new SyClientInitHandler()),
    SY_CLIENT_LOGIN_BY_TOKEN("loginByToken", new LoginByTokenHandler()),
    SY_CLIENT_LOGIN_BY_ACCOUNT_ID("loginByAccountId", new LoginByUuidHandler()),
    SY_CLIENT_LOGOUT("logOut", new LogOutHandler()),
    SY_CLIENT_ADD_CONNECT_LISTENER("addConnectListener", new AddConnectListenerHandler()),
    SY_CLIENT_GET_CONVERSATION_LIST("getConversationList", new GetConversationListHandler()),
    //SyClient配置结束


    //聊天管理配置开始
    CHAT_SEND_MESSAGE("sendMessage", new SendMessageHandler()),
    CHAT_SAVE_MESSAGE_TO_LOCAL("saveMessageToLocal", new SaveMessageToLocalHandler()),
    CHAT_GET_MESSAGE_LIST("getMessageList", new GetMessageListHandler()),
    CHAT_DELETE_MESSAGE("deleteMessage", new DeleteMessageHandler()),
    CHAT_UPDATE_MESSAGE("updateMessage", new UpdateMessageHandler()),
    CHAT_GET_MESSAGE("getMessage", new GetMessageHandler()),
    //聊天管理配置结束

    //会话管理配置开始
    CONVERSATION_CREATE_SIGN_CONVERSATION("createSignConversation", new CreateSignConversationHandler()),
    CONVERSATION_ADD_CHATTING("addChatting", new AddChattingHandler()),
    CONVERSATION_GET_ALL_UN_READ_NUM("getAllUnReadNum", new GetAllUnReadNumHandler()),
    CONVERSATION_GET_SESSION_ID_BY_USERID("getSessionIdByUserId", new GetSessionIdByUserIdHandler()),
    CONVERSATION_GET_UNREAD_NUM("getUnReadNum", new GetUnReadNumHandler()),
    CONVERSATION_REMOVE_CHATTING("removeChatting", new RemoveChattingHandler()),
    CONVERSATION_REMOVE_CONVERSATION("removeConversation", new RemoveConversationHandler()),
    CONVERSATION_REST_UNREAD_COUNT("restUnReadCount", new RestUnReadCountHandler()),
    CONVERSATION_SET_CONVERSATION_TOPPING("setConversationTopping", new SetConversationToppingHandler())
    //会话管理配置结束

    ;


    MethodEnum(String methodName, MethodHandler methodHandler) {
        this.methodHandler = methodHandler;
        this.methodName = methodName;
    }

    final String methodName;

    final MethodHandler methodHandler;

    public String getMethodName() {
        return methodName;
    }

    public MethodHandler getMethodHandler() {
        return methodHandler;
    }
}
