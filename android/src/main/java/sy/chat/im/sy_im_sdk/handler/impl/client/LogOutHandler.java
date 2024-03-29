package sy.chat.im.sy_im_sdk.handler.impl.client;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.im.SyClient;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.sy_im_sdk.SyImSdkPlugin;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class LogOutHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
        SyClient.getInstance().logOut(new SyCallback<String>() {
            @Override
            public void onSuccess(String s) {
                result.success(s);
                SyClient.getInstance().chatManager().removeMessageListener(SyImSdkPlugin.onMessageListener);
                //缺少移除链接监听，更新SDK后添加该方法
            }

            @Override
            public void onFail(int i, String s) {
                result.error(String.valueOf(i), s, "退出登录失败！");
            }
        });
    }

}
