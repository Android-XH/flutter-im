import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';
import 'package:sy_im_sdk/sy_client.dart';

class GetMessageList {
  /// 获取聊天记录
  void _getMessageList() {
    SyMessage syMessage = SyMessage();
    syMessage.msgTimeStamp = DateTime.timestamp().millisecond;
    syMessage.sessionId = "会话ID";
    int pageSize = 20;
    SyClient.getInstance().chatManager().getMessageList(
        starMessage: syMessage,
        pageSize: pageSize,
        callBack: SyCallBack(onSuccess: (messageList) {
          //todo 处理消息
        }, onFail: (code, error) {
          //todo 处理查询失败
        }));
  }
}
