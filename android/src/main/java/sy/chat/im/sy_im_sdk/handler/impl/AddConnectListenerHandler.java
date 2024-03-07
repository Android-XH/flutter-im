package sy.chat.im.sy_im_sdk.handler.impl;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.dao.bean.AuthInfo;
import sy.chat.im.listener.OnConnectListener;
import sy.chat.im.sy_im_sdk.SyImSdkPlugin;
import sy.chat.im.sy_im_sdk.common.MethodEnum;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class AddConnectListenerHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        SyClient.getInstance().addConnectListener(SyImSdkPlugin.onConnectListener);
        result.success("success");
    }

    @Override
    public String methodName() {
        return MethodEnum.SY_CLIENT_ADD_CONNECT_LISTENER.getMethodName();
    }

}
