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


import sy.chat.im.dao.bean.AuthInfo;
import sy.chat.im.listener.ConversationListener;
import sy.chat.im.listener.OnConnectListener;
import sy.chat.im.listener.OnMessageListener;
import sy.chat.im.manager.data.SyConversation;
import sy.chat.im.manager.data.SyMessage;
import sy.chat.im.netty.listener.MessageListener;
import sy.chat.im.sy_im_sdk.common.ChannelCommon;
import sy.chat.im.sy_im_sdk.common.MethodEnum;
import sy.chat.im.sy_im_sdk.data.ConnectData;
import sy.chat.im.sy_im_sdk.data.MessageData;
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
    private static final Handler handler = new Handler(Looper.getMainLooper());

    private final HashMap<String, MethodHandler> methodHandlerHashMap = new HashMap<>();

    public static final OnConnectListener onConnectListener = new OnConnectListener() {
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

    public static final ConversationListener conversationListener = new ConversationListener() {
        @Override
        public void onChanger(List<SyConversation> list) {
            postConversationData(list);
        }
    };

    public static final OnMessageListener onMessageListener = new OnMessageListener() {
        @Override
        public void onMessage(SyMessage syMessage) {
            MessageData messageData = new MessageData();
            messageData.setType("onMessage");
            messageData.setData(GsonUtil.toJson(syMessage));
            postChatMessageData(messageData);
        }

        @Override
        public void onCustomMsg(SyMessage syMessage) {
            MessageData messageData = new MessageData();
            messageData.setType("onCustomMsg");
            messageData.setData(GsonUtil.toJson(syMessage));
            postChatMessageData(messageData);
        }

        @Override
        public void onCmdMsg(SyMessage syMessage) {
            MessageData messageData = new MessageData();
            messageData.setType("onCmdMsg");
            messageData.setData(GsonUtil.toJson(syMessage));
            postChatMessageData(messageData);
        }

        @Override
        public void onUnLineMsg(List<SyMessage> list) {
            MessageData messageData = new MessageData();
            messageData.setType("onUnLineMsg");
            messageData.setData(GsonUtil.toJson(list));
            postChatMessageData(messageData);
        }

        @Override
        public void onStatusChange(List<SyMessage> list) {
            MessageData messageData = new MessageData();
            messageData.setType("onStatusChange");
            messageData.setData(GsonUtil.toJson(list));
            postChatMessageData(messageData);
        }
    };


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
            } else {
                result.notImplemented();
            }
        } catch (Exception e) {
            result.error("调用失败", e.getMessage(), e);
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        methodChannel.setMethodCallHandler(null);

    }

    public static void postConnectData(String type, int code, String msg) {
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
        handler.post(new Runnable() {
            @Override
            public void run() {
                conversationChannel.send(GsonUtil.toJson(list));
            }
        });
    }

    //回调消息
    public static void postChatMessageData(MessageData messageData) {
        handler.post(new Runnable() {
            @Override
            public void run() {
                chaMessageChannel.send(GsonUtil.toJson(messageData));
            }
        });
    }
}
