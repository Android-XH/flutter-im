
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sy_im_sdk/channel/sy_im_sdk_conversation_interface.dart';
import 'package:sy_im_sdk/common/channel_common.dart';
import 'package:sy_im_sdk/common/sy_client_method_common.dart';

import '../../listener/sy_call_back.dart';
import '../../manager/data/sy_conversation.dart';
import '../sy_im_sdk_platform_interface.dart';

/// An implementation of [SyImSdkPlatform] that uses method channels.
class SyImSdkConversationImpl extends SyImSdkConversation {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel(ChannelCommon.syClientMethodChannel);

  @override
  void getConversationList(
      {required SyCallBack<List<SyConversation>> callback})  {}

  @override
  void createSignConversation(
      {required String uuid,
      required SyCallBack<SyConversation> callback})  {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("uuid", () => uuid);
    methodChannel
        .invokeMethod(SyClientMethodCommon.createSignConversation, arguments)
        .then((value) =>
            callback.onSuccess(SyConversation.fromJson(jsonDecode(value))))
        .catchError((e) => callback.onFail.call(e.code, e.message!));
  }
}
