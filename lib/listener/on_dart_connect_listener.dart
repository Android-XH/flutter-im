import '../manager/data/auth_info.dart';

class OnDartConnectListener {
  OnDartConnectListener(
      {required this.onForcedOffLine,
      required this.onConnectSuccess,
      required this.onConnectFail});

  /// 被强制下线
  /// 1、后台限制登录
  /// 2、用户在其他设备登录
  final void Function() onForcedOffLine;

  ///链接成功
  final void Function() onConnectSuccess;

  ///链接断开
  final void Function(int code, String errMsg) onConnectFail;
}
