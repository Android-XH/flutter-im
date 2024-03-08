import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';
import 'package:sy_im_sdk/sy_client.dart';

class SendMessage {


  /// @title:构造消息接收人对象 ///

  _getReceiveUserInfo() {
    SyContact receiveUserInfo = SyContact();
    receiveUserInfo.userId = "消息接收人用户ID";
    receiveUserInfo.avatar = "接收人头像";
    receiveUserInfo.nickName = "消息接收人用户昵称";
    return receiveUserInfo;
  }

  //发送文本消息
  _sendTxtMessage(String content) {
    SyMessage syMessage = SyMessage.buildTxtMsg(_getReceiveUserInfo(), content);
    SyClient.getInstance().chatManager().sendMessage(
        syMessage: syMessage,
        callBack: SyCallBack(onSuccess: (syMessage) {
          //todo 发送成功回调
        }, onFail: (code, error) {
          //todo 发送失败回调
        }));
  }

  //发送图片消息
  _sendImgMessage(Uri uri) {
    SyMessage syMessage = SyMessage.buildImgMsg(_getReceiveUserInfo(), uri);
    SyClient.getInstance().chatManager().sendMessage(
        syMessage: syMessage,
        callBack: SyCallBack(onSuccess: (syMessage) {
          //todo 发送成功回调
        }, onFail: (code, error) {
          //todo 发送失败回调
        }));
  }

  //发送视频消息
  _sendVideoMessage(Uri uri) {
    SyMessage syMessage = SyMessage.buildVideoMsg(_getReceiveUserInfo(), uri);
    SyClient.getInstance().chatManager().sendMessage(
        syMessage: syMessage,
        callBack: SyCallBack(onSuccess: (syMessage) {
          //todo 发送成功回调
        }, onFail: (code, error) {
          //todo 发送失败回调
        }));
  }

  //发送语音消息
  _sendVoiceMessage(Uri uri) {
    SyMessage syMessage = SyMessage.buildVoiceMsg(_getReceiveUserInfo(), uri);
    SyClient.getInstance().chatManager().sendMessage(
        syMessage: syMessage,
        callBack: SyCallBack(onSuccess: (syMessage) {
          //todo 发送成功回调
        }, onFail: (code, error) {
          //todo 发送失败回调
        }));
  }

  //发送自定义消息
  _sendCustomMessage(String content) {
    SyMessage syMessage =
        SyMessage.buildCustomMsg(_getReceiveUserInfo(), content);
    SyClient.getInstance().chatManager().sendMessage(
        syMessage: syMessage,
        callBack: SyCallBack(onSuccess: (syMessage) {
          //todo 发送成功回调
        }, onFail: (code, error) {
          //todo 发送失败回调
        }));
  }
}
