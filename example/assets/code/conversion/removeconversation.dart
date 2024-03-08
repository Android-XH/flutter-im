import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/sy_client.dart';

class RemoveConversation{

  /*移除指定sessionId的会话*/
  void removeConversation(String sessionId){
    SyClient.getInstance().getConversationManager().removeConversation(sessionId: sessionId, callback: SyCallBack<bool>(onSuccess: (success){
      /*成功*/
    }, onFail: (code,msg){
      /*失败*/
    }));
  }
}