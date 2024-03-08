package sy.chat.im.sy_im_sdk.handler.impl.chat;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.manager.data.SyMessage;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class GetMessageHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if(call.hasArgument("msgId")){
            String msgId=call.argument("msgId");
            SyClient.getInstance().chatManager().getMessage(msgId, new SyCallback<SyMessage>() {
                @Override
                public void onSuccess(SyMessage syMessage) {
                    result.success(GsonUtil.toJson(syMessage));
                }

                @Override
                public void onFail(int i, String s) {
                    result.error(String.valueOf(i),s,"getMessage error:"+s);
                }
            });
        }else{
            result.error("500", "msgId is null!", "Argument not found msgId key!");
        }
    }
}
