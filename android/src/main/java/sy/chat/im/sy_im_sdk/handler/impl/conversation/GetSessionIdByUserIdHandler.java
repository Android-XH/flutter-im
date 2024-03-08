package sy.chat.im.sy_im_sdk.handler.impl.conversation;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.Log;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.manager.data.SyConversation;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class GetSessionIdByUserIdHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if (call.hasArgument("userId")) {
            String uuId = call.argument("userId");
            String sid = SyClient.getInstance().conversationManager().getSessionIdByUserId(uuId);
            result.success(sid);
        }
    }
}
