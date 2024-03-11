package sy.chat.im.sy_im_sdk.handler.impl.contact;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.im.SyClient;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class IsFriendHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if (call.hasArgument("userId")) {
            String userId = call.argument("userId");
            boolean isFriend = SyClient.getInstance().contactManager().isFriend(userId);
            result.success(isFriend);
        }
    }
}
