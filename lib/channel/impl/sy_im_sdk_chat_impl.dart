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
  void sendMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    methodChannel
        .invokeMethod(SyClientMethodCommon.sendMessage,
            _createMessageArguments(syMessage))
        .then((value) =>
            callBack.onSuccess.call(SyMessage.fromJson(jsonDecode(value))))
        .catchError((e) => callBack.onFail.call(e.code, e.message!));
  }

  @override
  void saveMessageToLocal(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    methodChannel
        .invokeMethod(SyClientMethodCommon.saveMessageToLocal,
            _createMessageArguments(syMessage))
        .then((value) =>
            callBack.onSuccess.call(SyMessage.fromJson(jsonDecode(value))))
        .catchError((e) => callBack.onFail.call(e.code, e.message!));
  }

  @override
  void updateMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    methodChannel
        .invokeMethod(SyClientMethodCommon.updateMessage,
            _createMessageArguments(syMessage))
        .then((value) =>
            callBack.onSuccess.call(SyMessage.fromJson(jsonDecode(value))))
        .catchError((e) => callBack.onFail.call(e.code, e.message!));
  }

  @override
  void deleteMessage(
      {required String msgId, required SyCallBack<bool> callBack}) {
    Map<String, String> arguments = {};
    arguments.putIfAbsent("msgId", () => msgId);
    methodChannel
        .invokeMethod(SyClientMethodCommon.deleteMessage, arguments)
        .then((value) => callBack.onSuccess.call(value))
        .catchError((e) => callBack.onFail.call(e.code, e.message!));
  }

  @override
  void getMessageList(
      {required SyMessage starMessage,
      required int pageSize,
      required SyCallBack<List<SyMessage>> callBack}) {
    Map<String, String> arguments = _createMessageArguments(starMessage);
    arguments.putIfAbsent("pageSize", () => pageSize.toString());
    methodChannel
        .invokeMethod(SyClientMethodCommon.getMessageList, arguments)
        .then((value) {
      List<dynamic> list = jsonDecode(value);
      callBack.onSuccess.call(list.map((e) => SyMessage.fromJson(e)).toList());
    }).catchError((e) {
      callBack.onFail.call(e.code, e.message!);
    });
  }

  @override
  void getMessage(
      {required String msgId,
      String? sessionId,
      required SyCallBack<SyMessage> callBack}) {
    Map<String, String> arguments = {};
    arguments.putIfAbsent("msgId", () => msgId);
    if (sessionId != null && sessionId.isNotEmpty) {
      arguments.putIfAbsent("sessionId", () => sessionId);
    }
    methodChannel
        .invokeMethod(SyClientMethodCommon.getMessage, arguments)
        .then((value) =>
            callBack.onSuccess.call(SyMessage.fromJson(jsonDecode(value))))
        .catchError((e) => callBack.onFail.call(e.code, e.message!));
  }
}
