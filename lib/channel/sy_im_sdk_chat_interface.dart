import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/channel/impl/sy_im_sdk_chat_impl.dart';
import 'package:sy_im_sdk/channel/impl/sy_im_sdk_conversation_impl.dart';
import 'package:sy_im_sdk/config/sy_options.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';

import '../listener/sy_call_back.dart';
import '../manager/data/sy_auth_info.dart';
import 'impl/sy_im_sdk_method_channel.dart';

abstract class SyImSdkChat extends PlatformInterface {
  /// Constructs a SyImSdkPlatform.
  SyImSdkChat() : super(token: _token);

  static final Object _token = Object();

  static SyImSdkChat _instance = SyImSdkChatImpl();

  /// The default instance of [SyImSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelSyImSdk].
  static SyImSdkChat get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SyImSdkPlatform] when
  /// they register themselves.
  static set instance(SyImSdkChat instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> sendMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('sendMessage() has not been implemented.');
  }

  ///保存消息到本地
  Future<void> saveMessageToLocal(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('saveMessageToLocal() has not been implemented.');
  }

  /// 获取消息
  /// @param syMessage
  Future<void> getMessage(
      {required String msgId, required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('getMessage() has not been implemented.');
  }

  /// 更新消息
  /// @param syMessage
  Future<void> updateMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('updateMessage() has not been implemented.');
  }

  /// 获取会话最后一条消息记录
  /// @param sessionId 会话ID
  Future<void> getLastMessage(
      {required String sessionId, required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('getLastMessage() has not been implemented.');
  }

  /// 查询历史消息
  /// @param starMessage 起始消息
  /// @param pageSize    查询条数
  Future<void> getMessageList(
      {required SyMessage starMessage,
      required int pageSize,
      required SyCallBack<List<SyMessage>> callBack}) {
    throw UnimplementedError('getMessageList() has not been implemented.');
  }

  /// 删除消息
  /// @param msgId
  Future<void> deleteMessage(
      {required String msgId, required SyCallBack<bool> callBack}) {
    throw UnimplementedError('deleteMessage() has not been implemented.');
  }
}
