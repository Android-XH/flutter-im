import 'package:sy_im_sdk/listener/sy_conversation_listener.dart';
import 'package:sy_im_sdk/sy_client.dart';

class AddConversationListener {
  /*会话有变化时收到的监听*/
  var listener = ConversationListener((conversationList) {

  });
  /*注册监听*/
  void addConversationListener() {
    SyClient.getInstance().getConversationManager().addConversationListener(listener);
  }
  /*不需要时候可以取消监听*/
  void removeConversationListener() {
    SyClient.getInstance().getConversationManager().removeConversationListener(listener);
  }
}
