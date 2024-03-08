import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/channel/impl/sy_im_sdk_chat_impl.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';

import '../listener/sy_call_back.dart';
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

  void sendMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('sendMessage() has not been implemented.');
  }

  ///保存消息到本地
  void saveMessageToLocal(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('saveMessageToLocal() has not been implemented.');
  }

  /// 获取消息
  /// @param syMessage
  void getMessage(
      {required String msgId,
      required String sessionId,
      required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('getMessage() has not been implemented.');
  }

  /// 更新消息
  /// @param syMessage
  void updateMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('updateMessage() has not been implemented.');
  }

  /// 查询历史消息
  /// @param starMessage 起始消息
  /// @param pageSize    查询条数
  void getMessageList(
      {required SyMessage starMessage,
      required int pageSize,
      required SyCallBack<List<SyMessage>> callBack}) {
    throw UnimplementedError('getMessageList() has not been implemented.');
  }

  /// 删除消息
  /// @param msgId
  void deleteMessage(
      {required String msgId,
      required String sessionId,
      required SyCallBack<bool> callBack}) {
    throw UnimplementedError('deleteMessage() has not been implemented.');
  }
}
