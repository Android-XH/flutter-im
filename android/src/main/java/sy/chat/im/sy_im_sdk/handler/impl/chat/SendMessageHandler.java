package sy.chat.im.sy_im_sdk.handler.impl.chat;

import android.content.Context;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.manager.callBack.SySendCallback;
import sy.chat.im.manager.data.SyMessage;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class SendMessageHandler implements MethodHandler {
    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result, Context context) {
        if (call.hasArgument("syMessage")) {
            String syMessageJson = call.argument("syMessage");
            SyMessage syMessage = GsonUtil.parseData(syMessageJson, SyMessage.class);
            SyClient.getInstance().chatManager().sendMessage(syMessage, new SySendCallback() {
                @Override
                public void onSuccess(SyMessage syMessage) {
                    result.success(GsonUtil.toJson(syMessage));
                }

                @Override
                public void onFail(SyMessage syMessage, int i, String s) {
                    result.error(String.valueOf(i), s, GsonUtil.toJson(syMessage));
                }

                @Override
                public void onProgress(int i) {

                }
            });
        } else {
            result.error("500", "syMessage is null!", "Argument not found syMessage key!");
        }
    }
}
