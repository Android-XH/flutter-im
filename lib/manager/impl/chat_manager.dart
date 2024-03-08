import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sy_im_sdk/channel/sy_im_sdk_chat_interface.dart';
import 'package:sy_im_sdk/common/channel_common.dart';
import 'package:sy_im_sdk/data/chat_data.dart';
import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/chat_manager_interface.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';

class ChatManager implements ChatManagerInterface {
  //注册链消息听
  final basicMessageChannel = const BasicMessageChannel(
      ChannelCommon.syClientChatChannel, StringCodec());

  ChatManager() {
    //接收链接消息
    basicMessageChannel.setMessageHandler((message) async {
      print("收到消息：$message");
      if (_messageList.isNotEmpty && message != null && message.isNotEmpty) {
        ChatData chatData = ChatData.fromJson(jsonDecode(message));
        String data = chatData.data ?? "";
        if (chatData.type != null && data.isNotEmpty) {
          List<dynamic> list = jsonDecode(data);
          List<SyMessage> syMessageList =
              list.map((item) => SyMessage.fromJson(item)).toList();
          switch (chatData.type) {
            case "onMessage":
            case "onCustomMsg":
            case "onUnLineMsg":
              for (var element in _messageList) {
                element.onMessage(syMessageList);
              }
              break;
            case "onStatusChange":
              for (var element in _messageList) {
                element.onStatusChange(syMessageList);
              }
              break;
            case "onCmdMsg":
              for (var element in _messageList) {
                element.onCmdMsg(syMessageList);
              }
              break;
          }
        }
      }
      return 'success';
    });
  }

  final List<OnMessageListener> _messageList = List.empty(growable: true);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  void addMessageListener(OnMessageListener onMessageListener) {
    _messageList.add(onMessageListener);
  }

  @override
  void removeMessageListener(OnMessageListener onMessageListener) {
    _messageList.remove(onMessageListener);
  }

  @override
  void sendMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    SyImSdkChat.instance.sendMessage(syMessage: syMessage, callBack: callBack);
  }

  @override
  void deleteMessage(
      {required String msgId,
        required String sessionId,
      required SyCallBack<bool> callBack}) {
    SyImSdkChat.instance
        .deleteMessage(msgId: msgId, sessionId: sessionId, callBack: callBack);
  }

  @override
  void getMessage(
      {required String msgId,
        required String sessionId,
      required SyCallBack<SyMessage> callBack}) {
    SyImSdkChat.instance
        .getMessage(msgId: msgId, sessionId: sessionId, callBack: callBack);
  }

  @override
  void getMessageList(
      {required SyMessage starMessage,
      required int pageSize,
      required SyCallBack<List<SyMessage>> callBack}) {
    SyImSdkChat.instance.getMessageList(
        starMessage: starMessage, pageSize: pageSize, callBack: callBack);
  }

  @override
  void saveMessageToLocal(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    SyImSdkChat.instance
        .saveMessageToLocal(syMessage: syMessage, callBack: callBack);
  }

  @override
  void updateMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    SyImSdkChat.instance
        .updateMessage(syMessage: syMessage, callBack: callBack);
  }
}
