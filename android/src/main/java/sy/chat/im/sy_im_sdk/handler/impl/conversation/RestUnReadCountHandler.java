package sy.chat.im.sy_im_sdk.handler.impl.conversation;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.im.SyClient;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class RestUnReadCountHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if (call.hasArgument("sessionId")) {
            String sessionId = call.argument("sessionId");
            SyClient.getInstance().conversationManager().restUnReadCount(sessionId);
            result.success("restUnReadCount success");
        }
    }
}
