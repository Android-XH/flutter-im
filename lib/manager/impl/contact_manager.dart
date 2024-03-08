import 'package:sy_im_sdk/channel/sy_im_sdk_contact_interface.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';

import '../contact_interface.dart';

 class ContactManager extends ContactInterface{
  @override
  void addFriend({required String userId, SyCallBack<bool>? callback}) {
    SyImSdkContact.instance.addFriend(userId: userId);
  }

  @override
  void deleteFriend({required String userId, SyCallBack<bool>? callback}) {
    SyImSdkContact.instance.deleteFriend(userId: userId);
  }

  @override
  void editFriendRemark({required String userId, required String remark, SyCallBack<bool>? callback}) {
    SyImSdkContact.instance.editFriendRemark(userId: userId, remark: remark);
  }

  @override
  void getUserInfo({required String userId, required SyCallBack<SyContact> callback}) {
    SyImSdkContact.instance.getUserInfo(userId: userId, callback: callback);
  }

  @override
  Future<SyContact> getUserInfoFromCache(String userId) async {
   var result = await SyImSdkContact.instance.getUserInfoFromCache(userId).then((value) => null);
   return (result as  SyContact);
  }

  @override
  Future<bool> isFriend(String userId)async {
    var result = await SyImSdkContact.instance.isFriend(userId).then((value) => null);
    return (result as  bool);
  }
 

}