import 'package:flutter/services.dart';
import 'package:sy_im_sdk/channel/sy_im_sdk_chat_interface.dart';
import 'package:sy_im_sdk/common/channel_common.dart';
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
      print("收到消息message:${message}");
      return 'success';
    });
  }

  final List<OnMessageListener> _messageList = List.empty(growable: true);

  @override
  void addMessageListener(OnMessageListener onMessageListener) {
    _messageList.add(onMessageListener);
  }

  @override
  void removeMessageListener(OnMessageListener onMessageListener) {
    _messageList.remove(onMessageListener);
  }

  @override
  void sendMessage(SyMessage syMessage, SyCallBack<SyMessage> callBack) {
    SyImSdkChat.instance.sendMessage(syMessage: syMessage, callback: callBack);
  }
}
