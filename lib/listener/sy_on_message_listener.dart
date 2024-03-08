import 'package:sy_im_sdk/manager/data/sy_message.dart';

class OnMessageListener {
  OnMessageListener(
      {required this.onMessage,
      required this.onCmdMsg,
      required this.onStatusChange});

  ///收到新消息
  final void Function(List<SyMessage> syMessage) onMessage;

  //消息状态变更
  final void Function(List<SyMessage> syMessage) onStatusChange;

  ///命令消息
  final void Function(List<SyMessage> syMessage) onCmdMsg;
}
