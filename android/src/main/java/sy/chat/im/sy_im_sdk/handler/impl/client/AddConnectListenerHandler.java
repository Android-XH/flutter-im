package sy.chat.im.sy_im_sdk.handler.impl.client;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.im.SyClient;
import sy.chat.im.sy_im_sdk.SyImSdkPlugin;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class AddConnectListenerHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        SyClient.getInstance().addConnectListener(SyImSdkPlugin.onConnectListener);
        result.success("success");
    }

}
