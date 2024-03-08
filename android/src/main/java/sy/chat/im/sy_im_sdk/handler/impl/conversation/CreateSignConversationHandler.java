package sy.chat.im.sy_im_sdk.handler.impl.conversation;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.Log;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import sy.chat.api.util.GsonUtil;
import sy.chat.im.SyClient;
import sy.chat.im.manager.callBack.SyCallback;
import sy.chat.im.manager.data.SyContact;
import sy.chat.im.manager.data.SyConversation;
import sy.chat.im.sy_im_sdk.common.MethodEnum;
import sy.chat.im.sy_im_sdk.handler.MethodHandler;

public class CreateSignConversationHandler implements MethodHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context) {


        if (call.hasArgument("userId")) {
            String uuId = call.argument("userId");
            SyClient.getInstance().conversationManager().createSignConversation(uuId, new SyCallback<SyConversation>() {
                @Override
                public void onSuccess(SyConversation syConversation) {
                    Log.i("sy.chat----->", GsonUtil.toJson(syConversation));
                    result.success(GsonUtil.toJson(syConversation));
                }

                @Override
                public void onFail(int i, String s) {
                    result.error(String.valueOf(i), s, "error:" + s);
                }
            });
        } else if (call.hasArgument("contact")) {
            String contact = call.argument("contact");
            try {
                SyContact syContact = GsonUtil.parseData(contact, SyContact.class);
                SyClient.getInstance().conversationManager().createSignConversation(syContact, new SyCallback<SyConversation>() {
                    @Override
                    public void onSuccess(SyConversation syConversation) {
                        Log.i("sy.chat----->", GsonUtil.toJson(syConversation));
                        result.success(GsonUtil.toJson(syConversation));
                    }

                    @Override
                    public void onFail(int i, String s) {
                        result.error(String.valueOf(i), s, "error:" + s);
                    }
                });
            } catch (Exception e) {
                result.error(String.valueOf(e.getMessage()), "", e);
            }
        }

    }


}
