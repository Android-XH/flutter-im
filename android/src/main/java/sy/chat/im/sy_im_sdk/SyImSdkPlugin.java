package sy.chat.im.sy_im_sdk;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.StringCodec;
import sy.chat.api.util.GsonUtil;


import sy.chat.im.manager.data.SyConversation;
import sy.chat.im.manager.data.SyMessage;
import sy.chat.im.sy_im_sdk.common.ChannelCommon;
import sy.chat.im.sy_im_sdk.common.MethodEnum;
import sy.chat.im.sy_im_sdk.data.ConnectData;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

/**
 * SyImSdkPlugin
 */
public class SyImSdkPlugin implements FlutterPlugin, MethodCallHandler {
    //函数调用通道
    private MethodChannel methodChannel;
    //链接监听通道
    private static BasicMessageChannel<String> connectChannel;
    //会话监听通道
    private static BasicMessageChannel<String> conversationChannel;
    //聊天消息监听通道
    private static BasicMessageChannel<String> chaMessageChannel;
    //应用上下文
    private Context mContext;
    //UI主线程
    private static Handler handler = new Handler(Looper.getMainLooper());

    private final HashMap<String, MethodHandler> methodHandlerHashMap = new HashMap<>();

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), ChannelCommon.SY_SDK_METHOD_CHANNEL);
        methodChannel.setMethodCallHandler(this);
        mContext = flutterPluginBinding.getApplicationContext();
        connectChannel = new BasicMessageChannel<>(flutterPluginBinding.getBinaryMessenger(), ChannelCommon.SY_SDK_CONNECT_CHANNEL, StringCodec.INSTANCE);
        conversationChannel = new BasicMessageChannel<>(flutterPluginBinding.getBinaryMessenger(), ChannelCommon.SY_CLIENT_CONVERSATION_CHANNEL, StringCodec.INSTANCE);
        chaMessageChannel = new BasicMessageChannel<>(flutterPluginBinding.getBinaryMessenger(), ChannelCommon.SY_CLIENT_CHAT_MESSAGE_CHANNEL, StringCodec.INSTANCE);
        for (MethodEnum methodEnum : MethodEnum.values()) {
            methodHandlerHashMap.put(methodEnum.getMethodName(), methodEnum.getMethodHandler());
        }

    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        String method = call.method;
        try {
            MethodHandler methodHandler = methodHandlerHashMap.get(method);
            if (methodHandler != null) {
                methodHandler.onMethodCall(call, result, mContext);
                return;
            }
        } catch (Exception e) {
            result.error("调用失败", e.getMessage(), e);
        }
        result.notImplemented();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        methodChannel.setMethodCallHandler(null);

    }

    public static void postConnectData(String type, int code, String msg) {
        // 在主线程中执行需要的操作
        handler.post(new Runnable() {
            @Override
            public void run() {
                ConnectData connectData = new ConnectData();
                connectData.setType(type);
                connectData.setCode(code);
                connectData.setMsg(msg);
                connectChannel.send(GsonUtil.toJson(connectData));
            }
        });
    }

    //回调会话
    public static void postConversationData(List<SyConversation> list) {
        // 在主线程中执行需要的操作
        handler.post(new Runnable() {
            @Override
            public void run() {
                conversationChannel.send(GsonUtil.toJson(list));
            }
        });
    }

    //回调消息
    public static void postChatMessageData(List<SyMessage> list) {
        // 在主线程中执行需要的操作
        handler.post(new Runnable() {
            @Override
            public void run() {
                chaMessageChannel.send(GsonUtil.toJson(list));
            }
        });
    }
}
