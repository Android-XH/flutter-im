
import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';



abstract class ChatManagerInterface {
  void addMessageListener(OnMessageListener onMessageListener) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void removeMessageListener(OnMessageListener onMessageListener) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void sendMessage(SyMessage syMessage, SyCallBack<SyMessage> callBack) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
