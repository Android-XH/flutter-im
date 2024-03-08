import 'package:sy_im_sdk/manager/data/sy_message.dart';


class OnMessageListener {
  OnMessageListener({
    required this.onMessage,
    required this.onCmdMsg,
  });

  ///收到新消息
  final void Function(List<SyMessage> syMessage) onMessage;

  ///命令消息
  final void Function(SyMessage syMessage) onCmdMsg;

}
