import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sy_im_sdk/channel/sy_im_sdk_conversation_interface.dart';
import 'package:sy_im_sdk/common/channel_common.dart';
import 'package:sy_im_sdk/common/sy_client_method_common.dart';

import '../../common/session_type.dart';
import '../../listener/sy_call_back.dart';
import '../../manager/data/sy_contact.dart';
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
      {required SyCallBack<List<SyConversation>> callback}) {
    methodChannel
        .invokeMethod(SyClientMethodCommon.getConversationList)
        .then((value) {
      List<dynamic> list = jsonDecode(value);
      callback.onSuccess.call(
          list.map((e) => SyConversation.fromJson(jsonDecode(value))).toList());
    }).catchError((e) {
      callback.onFail.call(e.code, e.message!);
    });
  }

  @override
  void createSignConversationByUid(
      {required String uuid, required SyCallBack<SyConversation> callback}) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("userId", () => uuid);
    methodChannel
        .invokeMethod(SyClientMethodCommon.createSignConversation, arguments)
        .then((value) =>
            callback.onSuccess(SyConversation.fromJson(jsonDecode(value))))
        .catchError((e) => callback.onFail.call(e.code, e.message!));
  }

  @override
  void addChatting(String sessionId) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("sessionId", () => sessionId);
    methodChannel.invokeMethod(SyClientMethodCommon.addChatting, arguments);
  }

  @override
  void createSignConversationByContact(
      {required SyContact contact,
      required SyCallBack<SyConversation> callback}) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("contact", () => jsonEncode(contact.toJson()));
    methodChannel
        .invokeMethod(SyClientMethodCommon.createSignConversation, arguments)
        .then((value) =>
            callback.onSuccess(SyConversation.fromJson(jsonDecode(value))))
        .catchError((e) => callback.onFail.call(e.code, e.message!));
  }

  @override
  Future<Long> getAllUnReadNum() async {
    return await methodChannel
        .invokeMethod(SyClientMethodCommon.getAllUnReadNum);
  }

  @override
  Future<Long> getAllUnReadNumBySessionType(
      {required SessionType sessionType}) async {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("sessionType", () => jsonEncode(sessionType));
    return await methodChannel
        .invokeMethod(SyClientMethodCommon.getAllUnReadNum);
  }

  @override
  Future<String> getSessionIdByUserId(String userId) async {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("userId", () => jsonEncode(userId));
    return await methodChannel
        .invokeMethod(SyClientMethodCommon.getSessionIdByUserId);
  }

  @override
  Future<Long> getUnReadNum(String sessionId) async {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("sessionId", () => jsonEncode(sessionId));
    return await methodChannel.invokeMethod(SyClientMethodCommon.getUnReadNum);
  }

  @override
  void removeChatting(String sessionId) async {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("sessionId", () => jsonEncode(sessionId));
    return await methodChannel
        .invokeMethod(SyClientMethodCommon.removeChatting);
  }

  @override
  void removeConversation(
      {required String sessionId, required SyCallBack<bool> callback}) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("sessionId", () => jsonEncode(sessionId));
    methodChannel
        .invokeMethod(SyClientMethodCommon.removeConversation, arguments)
        .then((value) => callback.onSuccess(value))
        .catchError((e) => callback.onFail.call(e.code, e.message!));
  }

  @override
  void restUnReadCount(String sessionId) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("sessionId", () => jsonEncode(sessionId));
    methodChannel.invokeMethod(SyClientMethodCommon.restUnReadCount, arguments);
  }

  @override
  void setConversationTopping(
      {required String sessionId,
      required topping,
      required SyCallBack<bool> callback}) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("sessionId", () => jsonEncode(sessionId));
    arguments.putIfAbsent("topping", () => jsonEncode(topping));
    methodChannel
        .invokeMethod(SyClientMethodCommon.setConversationTopping, arguments)
        .then((value) => callback.onSuccess(value))
        .catchError((e) => callback.onFail.call(e.code, e.message!));
  }
}
