import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';

///聊天管理器接口
abstract class ChatManagerInterface {
  //添加消息监听
  void addMessageListener(OnMessageListener onMessageListener);

  //移除消息监听
  void removeMessageListener(OnMessageListener onMessageListener);

  /// 发送消息
  /// @param syMessage 消息对象
  /// @param callBack 回调对象
  void sendMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack});

  /// 查询消息
  /// @param msgId    消息ID
  /// @param callback
  /// @param sessionId 会话ID iOS 查询消息需要该参数
  void getMessage(
      {required String msgId,String? sessionId, required SyCallBack<SyMessage> callBack});

  /// 保存到消息到本地，并不发送到服务器
  /// @param syMessage
  void saveMessageToLocal(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack});

  /// 更新消息
  /// @param syMessage
  void updateMessage(
      {required SyMessage syMessage, required SyCallBack<SyMessage> callBack});


  /// 查询历史消息
  /// @param starMessage 起始消息，初始化可传入空
  /// @param pageSize    查询条数
  void getMessageList(
      {required SyMessage starMessage,
      required int pageSize,
      required SyCallBack<List<SyMessage>> callBack});

  /// 删除消息
  /// @param msgId
  void deleteMessage(
      {required String msgId,  String? sessionId, required SyCallBack<bool> callBack});
}
