import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sy_im_sdk/common/session_type.dart';
import 'package:sy_im_sdk/manager/conversation_manager_interface.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';
import 'package:sy_im_sdk/manager/data/sy_conversation.dart';

import '../../channel/sy_im_sdk_conversation_interface.dart';
import '../../common/channel_common.dart';
import '../../listener/sy_call_back.dart';
import '../../listener/sy_conversation_listener.dart';

///会话管理器
class ConversationManager extends ConversationManagerInterface {
  //注册链消息听
  final basicMessageChannel = const BasicMessageChannel(
      ChannelCommon.syClientConversationChannel, StringCodec());
  final List<ConversationListener> _conversationListenerList =
      List.empty(growable: true);

  ConversationManager() {
    //接收链接消息
    basicMessageChannel.setMessageHandler((message) async {
      print("收到会话message:${message}");
      if (message != null && _conversationListenerList.isNotEmpty) {
        for (var element in _conversationListenerList) {
          List<dynamic> list = jsonDecode(message);
          element
              .onChanger(list.map((e) => SyConversation.fromJson(e)).toList());
        }
      }
      return 'success';
    });
  }

  @override
  void addConversationListener(ConversationListener conversationListener) {
    _conversationListenerList.add(conversationListener);
  }

  @override
  void removeConversationListener(ConversationListener conversationListener) {
    _conversationListenerList.remove(conversationListener);
  }

  @override
  void addChatting(String sessionId) {
    SyImSdkConversation.instance.addChatting(sessionId);
  }

  @override
  void createSignConversationByContact(
      {required SyContact contact,
      required SyCallBack<SyConversation> callback}) {
    SyImSdkConversation.instance
        .createSignConversationByContact(contact: contact, callback: callback);
  }

  @override
  void createSignConversationByUid(
      {required String userId, required SyCallBack<SyConversation> callback}) {
    SyImSdkConversation.instance
        .createSignConversationByUid(userId: userId, callback: callback);
  }

  @override
  Future<int> getAllUnReadNum() async {
    var result =await SyImSdkConversation.instance.getAllUnReadNum();
    return result as int;
  }

  @override
  Future<int> getAllUnReadNumBySessionType(
      {required SessionType sessionType}) async {
    var result =await SyImSdkConversation.instance
        .getAllUnReadNumBySessionType(sessionType: sessionType);
    return result as int;
  }

  @override
  void getConversationList(
      {required SyCallBack<List<SyConversation>> callback}) {
    SyImSdkConversation.instance.getConversationList(callback: callback);
  }

  @override
  Future<String> getSessionIdByUserId(String userId) async {
    var result= await SyImSdkConversation.instance.getSessionIdByUserId(userId);
    return result as String;
  }

  @override
  Future<int> getUnReadNum(String sessionId) async {
    var result = SyImSdkConversation.instance.getUnReadNum(sessionId);
    return result as int;
  }

  @override
  void removeChatting(String sessionId) {
    SyImSdkConversation.instance.removeChatting(sessionId);
  }

  @override
  void removeConversation(
      {required String sessionId, required SyCallBack<bool> callback}) {
    SyImSdkConversation.instance
        .removeConversation(sessionId: sessionId, callback: callback);
  }

  @override
  void restUnReadCount(String sessionId) {
    SyImSdkConversation.instance.restUnReadCount(sessionId);
  }

  @override
  void setConversationTopping(
      {required String sessionId,
      required topping,
      required SyCallBack<bool> callback}) {
    SyImSdkConversation.instance.setConversationTopping(
        sessionId: sessionId, topping: topping, callback: callback);
  }
}
