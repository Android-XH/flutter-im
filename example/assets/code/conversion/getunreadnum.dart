import 'package:sy_im_sdk/common/session_type.dart';
import 'package:sy_im_sdk/sy_client.dart';

class GetUnReadNum {
  /*获取所有未读消息数量*/
  void getAllUnReadNum() async {
    int num =
        await SyClient.getInstance().getConversationManager().getAllUnReadNum();
  }


  /*根据会话的类型：单聊/群聊 获取 单聊/群聊 的所有未读消息数量*/
  void getAllUnReadNumBySessionType() async {
    var sessionType = SessionType.PRIVATE; /*var sessionType = SessionType.GROUP*/
    int num = await SyClient.getInstance()
        .getConversationManager()
        .getAllUnReadNumBySessionType(sessionType: sessionType);
  }


  /*根据会话Id查询该所有未读消息数量*/
  void getUnReadNum(String sessionId)async {
    int num = await SyClient.getInstance()
        .getConversationManager()
        .getUnReadNum(sessionId);
  }


  /*根据会话Id重置会话的未读消息数量*/
  void restUnReadCount(String sessionId) {
    SyClient.getInstance().getConversationManager().restUnReadCount(sessionId);
  }
}
