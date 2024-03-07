import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sy_im_sdk/manager/data/sy_conversation.dart';

import '../../channel/sy_im_sdk_conversation_interface.dart';
import '../../common/channel_common.dart';
import '../../listener/sy_call_back.dart';
import '../../listener/sy_conversation_listener.dart';

///会话管理器
class ConversationManager {
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

  void createSignConversation(
      {required String uuid, required SyCallBack<SyConversation> callback}) {
    SyImSdkConversation.instance
        .createSignConversationByUid(uuid: uuid, callback: callback);
  }

  void addConversationListener(ConversationListener conversationListener) {
    _conversationListenerList.add(conversationListener);
  }

  @override
  void removeConversationListener(ConversationListener conversationListener) {
    _conversationListenerList.remove(conversationListener);
  }
}
