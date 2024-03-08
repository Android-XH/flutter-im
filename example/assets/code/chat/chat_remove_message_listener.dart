import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';
import 'package:sy_im_sdk/sy_client.dart';

class RemoveMessageListener {
  void removeMessageListener() {
    OnMessageListener onMessageListener =
        OnMessageListener(onMessage: (List<SyMessage> syMessage) {
      //todo 处理新消息
    }, onCmdMsg: (List<SyMessage> syMessage) {
      //todo 处理命令消息
    }, onStatusChange: (List<SyMessage> syMessage) {
      //todo 处理状态变更消息
    });
    //移除消息监听
    SyClient.getInstance()
        .chatManager()
        .removeMessageListener(onMessageListener);
  }
}
