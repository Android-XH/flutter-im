import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';

///聊天管理器接口
abstract class ChatManagerInterface {
  void addMessageListener(OnMessageListener onMessageListener) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void removeMessageListener(OnMessageListener onMessageListener) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// 发送消息
  /// @param syMessage 消息对象
  /// @param callBack 回调对象
  void sendMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// 查询消息
  /// @param msgId    消息ID
  /// @param callback
  void getMessage(
      {required String msgId, required SyCallBack<SyMessage> callback});

  /// 保存到消息到本地，并不发送到服务器
  /// @param syMessage
  void saveMessageToLocal(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callback});

  /// 更新消息
  /// @param syMessage
  void updateMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callback});

  /// 获取会话最后一条消息记录
  /// @param sessionId 会话ID
  void getLastMessage(
      {required String sessionId, required SyCallBack<SyMessage> callback});

  /// 查询历史消息
  /// @param starMessage 起始消息，初始化可传入空
  /// @param pageSize    查询条数
  void getMessageList(
      {SyMessage starMessage,
      required int pageSize,
      required SyCallBack<List<SyMessage>> callback});

  /// 删除消息
  /// @param msgId
  void deleteMessage(
      {required String msgId, required SyCallBack<bool> syCallback});
}
