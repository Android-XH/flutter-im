import 'package:sy_im_sdk/manager/data/sy_message.dart';


class OnMessageListener {
  OnMessageListener({
    required this.onMessage,
    required this.onCustomMsg,
    required this.onCmdMsg,
    required this.onUnLineMsg,
  });

  ///收到新消息
  final void Function(SyMessage syMessage) onMessage;

  ///自定义消息
  final void Function(SyMessage syMessage) onCustomMsg;

  ///命令消息
  final void Function(SyMessage syMessage) onCmdMsg;

  ///离线消息
  final void Function(List<SyMessage> syMessageList) onUnLineMsg;
}
