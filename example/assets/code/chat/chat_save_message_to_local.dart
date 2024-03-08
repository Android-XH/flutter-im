import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';
import 'package:sy_im_sdk/sy_client.dart';

class SaveMessageToLocal {
  _getReceiveUserInfo() {
    SyContact receiveUserInfo = SyContact();
    receiveUserInfo.userId = "消息接收人用户ID";
    receiveUserInfo.avatar = "接收人头像";
    receiveUserInfo.nickName = "消息接收人用户昵称";
    return receiveUserInfo;
  }

  void saveMessageToLocal(String content) {
    SyMessage syMessage = SyMessage.buildTxtMsg(_getReceiveUserInfo(), content);

    SyClient.getInstance().chatManager().saveMessageToLocal(
        syMessage: syMessage,
        callBack: SyCallBack(onSuccess: (syMessage) {
          //todo 保存成功回调
        }, onFail: (code, error) {
          //todo 保存失败回调
        }));
  }
}
