package sy.chat.im.sy_im_sdk.handler;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public interface MethodHandler {

    void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result, Context context);

    String className();
}
