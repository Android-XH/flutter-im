import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sy_im_sdk/channel/sy_im_sdk_chat_interface.dart';
import 'package:sy_im_sdk/common/channel_common.dart';
import 'package:sy_im_sdk/common/sy_client_method_common.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';

import '../../listener/sy_call_back.dart';
import '../sy_im_sdk_platform_interface.dart';

/// An implementation of [SyImSdkPlatform] that uses method channels.
class SyImSdkChatImpl extends SyImSdkChat {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel(ChannelCommon.syClientMethodChannel);

  Map<String, String> _createMessageArguments(SyMessage syMessage) {
    Map<String, String> arguments = {};
    arguments.putIfAbsent("syMessage", () => jsonEncode(syMessage));
    return arguments;
  }

  @override
  Future<void> sendMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    return methodChannel.invokeMethod(
        SyClientMethodCommon.sendMessage, _createMessageArguments(syMessage));
  }

  @override
  Future<void> saveMessageToLocal(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    return methodChannel.invokeMethod(SyClientMethodCommon.saveMessageToLocal,
        _createMessageArguments(syMessage));
  }

  @override
  Future<void> updateMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    return methodChannel.invokeMethod(
        SyClientMethodCommon.updateMessage, _createMessageArguments(syMessage));
  }

  @override
  Future<void> deleteMessage(
      {required String msgId, required SyCallBack<bool> callBack}) {
    Map<String, String> arguments = {};
    arguments.putIfAbsent("msgId", () => msgId);
    return methodChannel.invokeMethod(
        SyClientMethodCommon.deleteMessage, arguments);
  }

  @override
  Future<void> getLastMessage(
      {required String sessionId, required SyCallBack<SyMessage> callBack}) {
    Map<String, String> arguments = {};
    arguments.putIfAbsent("sessionId", () => sessionId);
    return methodChannel.invokeMethod(
        SyClientMethodCommon.saveMessageToLocal, arguments);
  }

  @override
  Future<void> getMessageList(
      {required SyMessage starMessage,
      required int pageSize,
      required SyCallBack<List<SyMessage>> callBack}) {
    Map<String, String> arguments = _createMessageArguments(starMessage);
    arguments.putIfAbsent("pageSize", () => pageSize.toString());
    return methodChannel.invokeMethod(
        SyClientMethodCommon.getMessageList, arguments);
  }

  @override
  Future<void> getMessage(
      {required String msgId, required SyCallBack<SyMessage> callBack}) {
    Map<String, String> arguments = {};
    arguments.putIfAbsent("msgId", () => msgId);
    return methodChannel.invokeMethod(
        SyClientMethodCommon.getMessage, arguments);
  }
}
