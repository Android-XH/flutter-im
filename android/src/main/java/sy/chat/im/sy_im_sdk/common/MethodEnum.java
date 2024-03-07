package sy.chat.im.sy_im_sdk.common;

import sy.chat.im.sy_im_sdk.handler.MethodHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.AddConnectListenerHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.LoginByUuidHandler;
import sy.chat.im.sy_im_sdk.handler.impl.conversation.GetConversationListHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.LogOutHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.LoginByTokenHandler;
import sy.chat.im.sy_im_sdk.handler.impl.client.SyClientInitHandler;

public enum MethodEnum {

    SY_CLIENT_INIT("init", new SyClientInitHandler()),
    SY_CLIENT_LOGIN_BY_TOKEN("loginByToken",new LoginByTokenHandler()),
    SY_CLIENT_LOGIN_BY_ACCOUNT_ID("loginByAccountId",new LoginByUuidHandler()),
    SY_CLIENT_LOGOUT("logOut",new LogOutHandler()),



    SY_CLIENT_ADD_CONNECT_LISTENER("addConnectListener",new AddConnectListenerHandler()),
    SY_CLIENT_GET_CONVERSATION_LIST("getConversationList",new GetConversationListHandler())

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
