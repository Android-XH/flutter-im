package sy.chat.im.sy_im_sdk.handler.impl.chat;

import android.content.Context;
import android.content.Intent;

import androidx.annotation.NonNull;

import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.manager.data.SyMessage;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class GetMessageListHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if (call.hasArgument("syMessage") && call.hasArgument("pageSize")) {
            String syMessageJson = call.argument("syMessage");
            Integer pageSize = call.argument("pageSize");
            SyMessage syMessage = GsonUtil.parseData(syMessageJson, SyMessage.class);
            List<SyMessage> syMessageList = SyClient.getInstance().chatManager().getMessageList(syMessage, pageSize == null ? 10 : pageSize);
            result.success(GsonUtil.toJson(syMessageList));
        } else {
            result.error("500", "msgId is null!", "Argument not found msgId key!");
        }
    }
}
