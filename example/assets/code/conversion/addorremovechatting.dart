import 'package:sy_im_sdk/sy_client.dart';

class AddOrRemoveChatting{
  /*进入聊天页调用*/
  void addChatting(String sessionId){
    SyClient.getInstance().getConversationManager().addChatting(sessionId);
  }



  /*退出聊天页调用，sdk会进行一些操作，比如重置该会话的未读消息*/
  void removeChatting(String sessionId){
    SyClient.getInstance().getConversationManager().removeChatting(sessionId);
  }
}