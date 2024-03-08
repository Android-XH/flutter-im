import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_conversation.dart';
import 'package:sy_im_sdk/sy_client.dart';

class GetConversationList {
  /*获取会话列表*/
  void getConversationList() {
    SyClient.getInstance().getConversationManager().getConversationList(
            callback: SyCallBack<List<SyConversation>>(onSuccess: (conversationList) {
          /*会话列表*/
        }, onFail: (code, msg) {
          /*异常*/

        }));
  }
}
