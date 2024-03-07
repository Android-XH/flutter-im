import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:sy_im_sdk/common/channel_common.dart';
import 'package:sy_im_sdk/config/sy_options.dart';
import 'package:sy_im_sdk/data/connect_data.dart';
import 'package:sy_im_sdk/listener/on_dart_connect_listener.dart';
import 'package:sy_im_sdk/manager/chat_manager.dart';
import 'package:sy_im_sdk/manager/conversation_manager.dart';
import 'package:sy_im_sdk/manager/data/auth_info.dart';
import 'package:sy_im_sdk/sy_client_interface.dart';

import 'channel/sy_im_sdk_platform_interface.dart';
import 'listener/sy_call_back.dart';

class SyClient implements SyClientInterface {
  ConversationManager conversationManager = ConversationManager();
  final ChatManager _chatManager = ChatManager();

  static SyClient? _instance;

  List<OnDartConnectListener> onConnectListeners = List.empty(growable: true);

  SyClient._();

  factory SyClient.getInstance() {
    _instance ??= SyClient._();
    return _instance!;
  }

  @override
  void init({SyOptions? syOptions}) {
    SyImSdkPlatform.instance.init(syOptions: syOptions ?? SyOptions());
    //注册链接监听
    const basicMessageChannel = BasicMessageChannel(
        ChannelCommon.syClientConnectChannel, StringCodec());
    //接收链接消息
    basicMessageChannel.setMessageHandler((message) async {
      ConnectData connectData =
          ConnectData.fromJson(jsonDecode(message.toString()));
      switch (connectData.type) {
        case "CONNECT_SUCCESS":
          if (onConnectListeners.isNotEmpty) {
            for (var element in onConnectListeners) {
              element.onConnectSuccess.call();
            }
          }
          break;
        case "CONNECT_FAIL":
          if (onConnectListeners.isNotEmpty) {
            for (var element in onConnectListeners) {
              element.onConnectFail.call(connectData.code!, connectData.msg!);
            }
          }
          break;
        case "FORCED_OFFLINE":
          if (onConnectListeners.isNotEmpty) {
            for (var element in onConnectListeners) {
              element.onForcedOffLine.call();
            }
          }
          break;
      }
      return 'success';
    });
  }

  @override
  void addConnectListener(OnDartConnectListener connectListener) {
    onConnectListeners.add(connectListener);
  }

  @override
  void removeConnectListener(OnDartConnectListener onConnectListener) {
    onConnectListeners.remove(onConnectListener);
  }

  @override
  void loginByToken(
      {required String token, required SyCallBack<AuthInfo> callback}) {
    SyImSdkPlatform.instance.loginByToken(token: token, callback: callback);
  }

  @override
  void loginByUUID(
      {required String uuid, required SyCallBack<AuthInfo> callback}) {
    SyImSdkPlatform.instance.loginByUUID(uuid: uuid, callback: callback);
  }

  @override
  void logOut({required SyCallBack<String> callback}) {
    SyImSdkPlatform.instance.logOut(callback: callback);
  }

  @override
  ConversationManager getConversationManager() {
    return conversationManager;
  }

  @override
  ChatManager chatManager() {
    return _chatManager;
  }
}
