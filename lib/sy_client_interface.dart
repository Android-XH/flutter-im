
import 'package:sy_im_sdk/manager/chat_manager_interface.dart';

import 'config/sy_options.dart';
import 'listener/sy_call_back.dart';
import 'listener/sy_on_dart_connect_listener.dart';
import 'manager/contact_interface.dart';
import 'manager/conversation_manager_interface.dart';
import 'manager/data/sy_auth_info.dart';

abstract class SyClientInterface {
  ///初始化SDK
  void init({SyOptions syOptions});

  /// 添加链接监听
  void addConnectListener(OnDartConnectListener connectListener);

  ///移除链接监听
  void removeConnectListener(OnDartConnectListener onConnectListener);

  ///通过token登录，token由第三方业务后台调用API获取
  void loginByToken(
      {required String token, required SyCallBack<AuthInfo> callback});

  ///通过业务方用户ID直接登录
  void loginByUUID(
      {required String uuid, required SyCallBack<AuthInfo> callback});

  /// 退出登录
  void logOut({required SyCallBack<String> callback});

  ConversationManagerInterface conversationManager();

  ChatManagerInterface chatManager();
  ContactInterface contactManager();
}
