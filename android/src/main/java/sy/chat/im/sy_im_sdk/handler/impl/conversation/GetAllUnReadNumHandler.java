package sy.chat.im.sy_im_sdk.handler.impl.conversation;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.im.SyClient;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class GetAllUnReadNumHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        Long num = SyClient.getInstance().conversationManager().getAllUnReadNum();
        result.success(num);
    }
}
