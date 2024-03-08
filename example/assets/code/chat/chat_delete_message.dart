import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';
import 'package:sy_im_sdk/sy_client.dart';

class AddMessageListener {
  void addMessageListener() {
    SyClient.getInstance().chatManager().deleteMessage(
          msgId: "消息ID",
          sessionId: '会话ID',
          callBack: SyCallBack(
            onSuccess: (bool status) {
              //todo 处理删除成功逻辑
            },
            onFail: (String code, String error) {
              //todo 处理删除失败逻辑
            },
          ),
        );
  }
}
