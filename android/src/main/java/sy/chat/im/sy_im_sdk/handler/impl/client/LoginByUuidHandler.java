package sy.chat.im.sy_im_sdk.handler.impl.client;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.dao.bean.AuthInfo;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.manager.data.SyMessage;
import sy.chat.im.sy_im_sdk.SyImSdkPlugin;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class LoginByUuidHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if (call.hasArgument("uuid")) {
            SyClient.getInstance().loginByAccountId(call.argument("uuid"), new SyCallback<AuthInfo>() {
                @Override
                public void onSuccess(AuthInfo authInfo) {
                    result.success(GsonUtil.toJson(authInfo));
                    SyImSdkPlugin.onMessageListener.onMessage(new SyMessage());
                    SyClient.getInstance().chatManager().addMessageListener(SyImSdkPlugin.onMessageListener);
//                    SyClient.getInstance().conversationManager().addConversationListener(SyImSdkPlugin.conversationListener);
                }

                @Override
                public void onFail(int i, String s) {
                    result.error(String.valueOf(i), s, "login failed:" + s);
                }
            });
        } else {
            result.error("500", "uuid is null!", "Argument not found uuid key!");
        }
    }

}
