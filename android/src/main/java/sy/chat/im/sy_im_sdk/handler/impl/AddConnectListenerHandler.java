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
        SyClient.getInstance().addConnectListener(new OnConnectListener() {
            @Override
            public void onForcedOffLine() {
                postConnectData("FORCED_OFFLINE", 500, "用户token失效或在其他设备登录!");
            }

            @Override
            public void onConnectFail(int i, String s) {
                postConnectData("CONNECT_FAIL", i, s);
            }

            @Override
            public void onConnectSuccess() {
                postConnectData("CONNECT_SUCCESS", 200, "connect success");
            }

            @Override
            public void onAuthSuccess(AuthInfo authInfo) {
                postConnectData("AUTH_SUCCESS", 200, GsonUtil.toJson(authInfo));
            }

            @Override
            public void onAuthFail(String s) {
                postConnectData("AUTH_FAIL", 500, s);
            }
        });
    }

    @Override
    public String className() {
        return MethodEnum.SY_CLIENT_ADD_CONNECT_LISTENER.getMethodName();
    }

    private void postConnectData(String type, int code, String s) {
        SyImSdkPlugin.postConnectData(type, code, s);
    }
}
