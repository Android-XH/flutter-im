package sy.chat.im.sy_im_sdk.handler.impl.chat;

import android.content.Context;

import androidx.annotation.NonNull;

import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.manager.data.SyMessage;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class SaveMessageToLocalHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if (call.hasArgument("syMessage")) {
            String syMessageJson = call.argument("syMessage");
            SyMessage syMessage = GsonUtil.parseData(syMessageJson, SyMessage.class);
            SyClient.getInstance().chatManager().saveMessageToLocal(syMessage, new SyCallback<SyMessage>() {
                @Override
                public void onSuccess(SyMessage syMessage) {
                    result.success(GsonUtil.toJson(syMessage));
                }

                @Override
                public void onFail(int i, String s) {
                    result.error(String.valueOf(i), s, "saveMessageToLocal error:" + s);
                }
            });
        } else {
            result.error("500", "syMessage is null!", "Argument not found syMessage key!");
        }

    }
}
