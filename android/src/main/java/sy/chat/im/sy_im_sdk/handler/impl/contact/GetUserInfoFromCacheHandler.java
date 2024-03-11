package sy.chat.im.sy_im_sdk.handler.impl.contact;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.manager.data.SyContact;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class GetUserInfoFromCacheHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        if (call.hasArgument("userId")) {
            String userId = call.argument("userId");
            SyContact userInfo = SyClient.getInstance().contactManager().getUserInfo(userId);
            result.success(GsonUtil.toJson(userInfo));
        }
    }
}
