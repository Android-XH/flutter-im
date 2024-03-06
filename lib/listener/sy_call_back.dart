import '../manager/data/auth_info.dart';

class SyCallBack<T> {
  SyCallBack({required this.onSuccess, required this.onFail});

  ///调用成功
  final void Function(T t) onSuccess;

  ///调用失败
  final void Function(String code, String errMsg) onFail;
}
