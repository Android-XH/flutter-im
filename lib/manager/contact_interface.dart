import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';

abstract class ContactInterface{

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