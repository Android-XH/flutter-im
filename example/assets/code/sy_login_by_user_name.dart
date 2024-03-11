import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/sy_client.dart';

class SyLoginByUserName {
  void loginByToken() {
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


class SyLoginByUuid {
  void loginByUuid() {
    SyClient.getInstance().loginByUUID(
        uuid: "uuid", // 第三方 uuid, 测试使用, 正式请使用 token 方式登录
        callback: SyCallBack(onSuccess: (authInfo) {
          //todo 处理登录成功逻辑
        }, onFail: (code, msg) {
          //todo 处理登录失败逻辑
        }));
  }
}