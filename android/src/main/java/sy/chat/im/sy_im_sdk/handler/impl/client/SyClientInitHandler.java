package sy.chat.im.sy_im_sdk.handler.impl.client;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.Log;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.config.SyOptions;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class SyClientInitHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {
            if (call.hasArgument("optionsJson")) {
                String optionsJson = call.argument("optionsJson");
                SyOptions syOptions = GsonUtil.parseData(optionsJson, SyOptions.class);
                if (call.hasArgument("environment")) {
                    String environment = call.argument("environment");
                    if (environment != null) {
                        switch (environment) {
                            case "prod":
                                syOptions.setSyEnvironmentEnum(SyOptions.SyEnvironmentEnum.PROD);
                                break;
                            case "dev":
                            default:
                                syOptions.setSyEnvironmentEnum(SyOptions.SyEnvironmentEnum.DEV);
                                break;
                        }
                    }
                }
                Log.i("SyImSdkPlugin", "syOptions=" + syOptions);
                SyClient.getInstance().init(context, syOptions);
            } else {
                SyClient.getInstance().init(context);
            }
            result.success("sdk init success");
    }

}
