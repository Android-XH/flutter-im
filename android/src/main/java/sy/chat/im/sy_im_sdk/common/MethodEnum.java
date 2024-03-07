package sy.chat.im.sy_im_sdk.common;

import sy.chat.im.sy_im_sdk.handler.MethodHandler;
import sy.chat.im.sy_im_sdk.handler.impl.AddConnectListenerHandler;
import sy.chat.im.sy_im_sdk.handler.impl.GetConversationListHandler;
import sy.chat.im.sy_im_sdk.handler.impl.LoginByTokenHandler;
import sy.chat.im.sy_im_sdk.handler.impl.SyClientInitHandler;

public enum MethodEnum {

    INIT("init", new SyClientInitHandler()),
    SY_CLIENT_LOGIN_BY_TOKEN("loginByToken",new LoginByTokenHandler()),

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
