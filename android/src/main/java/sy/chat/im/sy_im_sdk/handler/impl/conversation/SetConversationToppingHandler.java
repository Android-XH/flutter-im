package sy.chat.im.sy_im_sdk.handler.impl.conversation;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.im.SyClient;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class SetConversationToppingHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if (call.hasArgument("sessionId")) {
            String sessionId = call.argument("sessionId");
            boolean topping = Boolean.TRUE.equals(call.argument("topping"));
            SyClient.getInstance().conversationManager().setConversationTopping(sessionId, topping, new SyCallback<Boolean>() {
                @Override
                public void onSuccess(Boolean aBoolean) {
                    result.success(aBoolean);
                }

                @Override
                public void onFail(int i, String s) {
                    result.error(String.valueOf(i), s, s);
                }
            });

        }
    }
}
