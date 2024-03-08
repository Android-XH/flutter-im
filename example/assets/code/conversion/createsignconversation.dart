import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';
import 'package:sy_im_sdk/manager/data/sy_conversation.dart';
import 'package:sy_im_sdk/sy_client.dart';

class CreateSignConversation {

  /*当本地没有和对方的会话时，需要创建与对方的的会话*/
  void createSignConversationByUid(String userId) {
    SyClient.getInstance().getConversationManager().createSignConversationByUid(userId: userId, callback: SyCallBack<SyConversation>(
            onSuccess: (conversation) {
              /*会回调会话的信息*/
              /*sessionId 是会话id,发送消息需要*/
              var sessionId =  conversation.sessionId;
              /*会话中对方存在sdk服务器的用户信息*/
              var info = conversation.contact;
            },
            onFail: (code, msg) {
              /*错误*/
            }));
  }



  /*当你有对面的用户信息时候，可以用此方法创建会话，用户信息会直接存入sdk的数据库内*/
  void createSignConversationByContact() {
    SyContact contact =SyContact();
    /*contact.userId 为必传字段，其他信息可以根据业务需要自行增加*/
    contact.userId="";
    contact.avatar="";
    contact.nickName="";
    SyClient.getInstance().getConversationManager().createSignConversationByContact(contact: contact, callback: SyCallBack<SyConversation>(
        onSuccess: (conversation) {
          /*会回调会话的信息*/
          /*sessionId 是会话id,发送消息需要*/
          var sessionId =  conversation.sessionId;

        },
        onFail: (code, msg) {
          /*错误*/
        }));
  }
}
