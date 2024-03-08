import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';
import 'package:sy_im_sdk/sy_client.dart';

class GetMessage {
  /// 获取聊天记录
  void _getMessage() {
    SyClient.getInstance().chatManager().getMessage(
        msgId: "消息ID",
        sessionId: "会话ID",
        callBack: SyCallBack(onSuccess: (syMessage) {
          //todo 处理消息
        }, onFail: (code, error) {
          //todo 处理查询失败
        }));
  }
}
