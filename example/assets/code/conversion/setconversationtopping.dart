import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/sy_client.dart';

class SetConversationTopping {
  /*设置会话置顶 isSetTop true置顶，false取消置顶*/
  void setConversationTopping(String sessionId, bool isSetTop) {
    SyClient.getInstance().getConversationManager().setConversationTopping(
        sessionId: sessionId,
        topping: isSetTop,
        callback: SyCallBack<bool>(
            onSuccess: (success) {
              /*成功*/
            },
            onFail: (code, msg) {
              /*失败*/
            }));
  }
}
