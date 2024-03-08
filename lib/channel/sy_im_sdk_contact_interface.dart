import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../listener/sy_call_back.dart';
import '../manager/data/sy_contact.dart';
import 'impl/sy_im_sdk_contact_impl.dart';

abstract class SyImSdkContact extends PlatformInterface {
  SyImSdkContact() : super(token: _token);

  static final Object _token = Object();

  static final SyImSdkContact _instance = SyImSdkContactImpl();
  static SyImSdkContact get instance => _instance;
  /// 查询用户信息
  /// @param userId
  /// @return
  void getUserInfo({required String userId, required SyCallBack<SyContact> callback});

  /// 同步查询用户信息
  /// @param userId
  /// @return
  Future<SyContact> getUserInfoFromCache(String userId);

  /// 添加好友
  /// @param userId
  /// @param callback
  void addFriend({required String userId,  SyCallBack<bool>? callback});

  /// 删除好友
  /// @param userId
  /// @param callback
  void deleteFriend({required String userId,  SyCallBack<bool>? callback});

  /// 设置好友备注
  /// @param userId
  /// @param remark
  /// @param callback
  void editFriendRemark({required String userId,required String remark, SyCallBack<bool>? callback});

  /// 查询是否是好友
  /// @param userId
  /// @return
  Future<bool> isFriend(String userId);
}