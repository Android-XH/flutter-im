import 'package:flutter/services.dart';
import 'package:sy_im_sdk/manager/data/sy_conversation.dart';

import '../channel/sy_im_sdk_conversation_interface.dart';
import '../common/channel_common.dart';
import '../listener/sy_call_back.dart';

///会话管理器
class ConversationManager {
  //注册链消息听
  final basicMessageChannel = const BasicMessageChannel(
      ChannelCommon.syClientConversationChannel, StringCodec());

  ConversationManager() {
    //接收链接消息
    basicMessageChannel.setMessageHandler((message) async {
      print("收到会话message:${message}");
      return 'success';
    });
  }


  void createSignConversation({required String uuid, required SyCallBack<SyConversation> callback}) async {
    SyImSdkConversation.instance.createSignConversation(uuid: uuid, callback: callback);
  }
}
