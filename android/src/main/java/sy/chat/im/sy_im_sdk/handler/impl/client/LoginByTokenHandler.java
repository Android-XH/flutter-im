package sy.chat.im.sy_im_sdk.handler.impl.client;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.dao.bean.AuthInfo;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.sy_im_sdk.SyImSdkPlugin;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class LoginByTokenHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if (call.hasArgument("token")) {
            SyClient.getInstance().loginByToken(call.argument("token"), new SyCallback<AuthInfo>() {
                @Override
                public void onSuccess(AuthInfo authInfo) {
                    result.success(GsonUtil.toJson(authInfo));
                    SyClient.getInstance().chatManager().addMessageListener(SyImSdkPlugin.onMessageListener);
                    SyClient.getInstance().conversationManager().addConversationListener(SyImSdkPlugin.conversationListener);
                }

                @Override
                public void onFail(int i, String s) {
                    result.error(String.valueOf(i), s, "login failed:" + s);
                }
            });
        } else {
            result.error("500", "token is null!", "Argument not found token key!");
        }
    }

}
