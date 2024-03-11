import 'package:sy_im_sdk/sy_client.dart';

class IsFriend {

  /*判断是否是好友*/
  void isFriend(String userId) async {
    var isFriend = await SyClient.getInstance().contactManager().isFriend(userId);
  }
}
