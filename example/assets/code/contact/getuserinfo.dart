import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';
import 'package:sy_im_sdk/sy_client.dart';

class GetUserInfo {
  /*从sdk服务器中获得好友的用户信息*/
  void getUserInfo(String userId) {
    SyClient.getInstance().contactManager().getUserInfo(
        userId: userId,
        callback: SyCallBack<SyContact>(
            onSuccess: (contact) {}, onFail: (code, msg) {}));
  }
 /*从sdk缓存中获得好友的用户信息*/
  void getUserInfoFromCache(String userId) async {
    var contact = await SyClient.getInstance()
        .contactManager()
        .getUserInfoFromCache(userId);
  }
}
