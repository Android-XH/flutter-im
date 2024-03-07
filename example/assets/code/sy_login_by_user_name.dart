import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/sy_client.dart';

class SyLoginByUserName {
  void loginByUserName() {
    //调用业务登录接口获取token
    SyClient.getInstance().loginByToken(
        token: "token",
        callback: SyCallBack(onSuccess: (authInfo) {
          //todo 处理登录成功逻辑
        }, onFail: (code, msg) {
          //todo 处理登录失败逻辑
        }));
  }
}
