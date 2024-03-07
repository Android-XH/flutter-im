import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sy_im_sdk/channel/sy_im_sdk_chat_interface.dart';
import 'package:sy_im_sdk/common/channel_common.dart';
import 'package:sy_im_sdk/common/sy_client_method_common.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';

import '../sy_im_sdk_platform_interface.dart';

/// An implementation of [SyImSdkPlatform] that uses method channels.
class SyImSdkChatImpl extends SyImSdkChat {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel(ChannelCommon.syClientMethodChannel);

  @override
  Future<void> sendMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callback}) {
    Map<String, String> arguments = {};
    arguments.putIfAbsent("syMessage", () => jsonEncode(syMessage));
    return methodChannel.invokeMethod(
        SyClientMethodCommon.sendMessage, arguments);
  }
}
