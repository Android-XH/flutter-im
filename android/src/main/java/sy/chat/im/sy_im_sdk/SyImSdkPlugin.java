package sy.chat.im.sy_im_sdk;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.util.Map;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.StringCodec;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.config.SyOptions;
import sy.chat.im.dao.bean.AuthInfo;


import sy.chat.im.listener.OnConnectListener;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.sy_im_sdk.common.ChannelCommon;
import sy.chat.im.sy_im_sdk.common.MethodCommon;
import sy.chat.im.sy_im_sdk.data.ConnectData;
import sy.chat.im.util.LogTools;

/**
 * SyImSdkPlugin
 */
public class SyImSdkPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel methodChannel;

    private BasicMessageChannel<String> connectChannel;

    private Context mContext;
    Handler handler = new Handler(Looper.getMainLooper());
    private OnConnectListener onConnectListener = new OnConnectListener() {
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
    };

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), ChannelCommon.SY_SDK_METHOD_CHANNEL);
        methodChannel.setMethodCallHandler(this);
        mContext = flutterPluginBinding.getApplicationContext();
        connectChannel = new BasicMessageChannel<>(flutterPluginBinding.getBinaryMessenger(), ChannelCommon.SY_SDK_CONNECT_CHANNEL, StringCodec.INSTANCE);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        String method = call.method;

        Log.i("SyImSdkPlugin", "method=" + method + "[argument=" + call.arguments + "]");
        switch (method) {
            case MethodCommon.SY_CLIENT_INIT:
                try {
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
                        SyClient.getInstance().init(mContext, syOptions);
                    } else {
                        SyClient.getInstance().init(mContext);
                    }
                    //初始化成功，注册链接监听
                    SyClient.getInstance().addConnectListener(onConnectListener);
                    result.success("sdk init success");
                } catch (Exception e) {
                    result.error("500", e.getMessage(), e);
                }
                break;
            case MethodCommon.SY_CLIENT_LOGIN_BY_TOKEN:
                if (call.hasArgument("token")) {
                    SyClient.getInstance().loginByToken(call.argument("token"), new SyCallback<AuthInfo>() {
                        @Override
                        public void onSuccess(AuthInfo authInfo) {
                            result.success(GsonUtil.toJson(authInfo));
                        }

                        @Override
                        public void onFail(int i, String s) {
                            result.error(String.valueOf(i), s, "login failed:" + s);
                        }
                    });
                } else {
                    result.error("500", "token is null!", "Argument not found token key!");
                }
                break;
            case MethodCommon.SY_CLIENT_LOGIN_BY_ACCOUNT_ID:
                if (call.hasArgument("uuid")) {
                    SyClient.getInstance().loginByAccountId(call.argument("uuid"), new SyCallback<AuthInfo>() {
                        @Override
                        public void onSuccess(AuthInfo authInfo) {
                            result.success(GsonUtil.toJson(authInfo));
                        }

                        @Override
                        public void onFail(int i, String s) {
                            result.error(String.valueOf(i), s, "login failed:" + s);
                        }
                    });
                } else {
                    result.error("500", "uuid is null!", "Argument not found uuid key!");
                }
                break;
            case MethodCommon.SY_CLIENT_LOGOUT:
                SyClient.getInstance().logOut(new SyCallback<String>() {
                    @Override
                    public void onSuccess(String s) {
                        result.success(s);
                    }

                    @Override
                    public void onFail(int i, String s) {
                        result.error(String.valueOf(i), s, "logOut fail:" + s);
                    }
                });
                break;

            default:
                result.notImplemented();
                break;
        }


    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        methodChannel.setMethodCallHandler(null);

    }


    private void postConnectData(String type, int code, String msg) {

        handler.post(new Runnable() {
            @Override
            public void run() {
                // 在主线程中执行需要的操作
                ConnectData connectData = new ConnectData();
                connectData.setType(type);
                connectData.setCode(code);
                connectData.setMsg(msg);
                connectChannel.send(GsonUtil.toJson(connectData));
            }
        });


    }
}
