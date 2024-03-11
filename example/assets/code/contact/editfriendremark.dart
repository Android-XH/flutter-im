import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/sy_client.dart';

class EditFriendRemark {
  /*给好友添加备注*/
  void editFriendRemark(String userId, String remark) {
    SyClient.getInstance().contactManager().editFriendRemark(
        userId: userId,
        remark: remark,
        callback: SyCallBack<bool>(onSuccess: (success) {
          /*成功回调*/
        }, onFail: (code, msg) {
          /*失败回调*/
        }));
  }
}
