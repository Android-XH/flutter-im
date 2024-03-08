import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';

import '../../common/channel_common.dart';
import '../sy_im_sdk_contact_interface.dart';

class SyImSdkContactImpl extends SyImSdkContact {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(ChannelCommon.syClientMethodChannel);

  @override
  void addFriend({required String userId, SyCallBack<bool>? callback}) {

  }

  @override
  void deleteFriend({required String userId, SyCallBack<bool>? callback}) {
    // TODO: implement deleteFriend
  }

  @override
  void editFriendRemark({required String userId,required String remark, SyCallBack<bool>? callback}) {
    // TODO: implement editFriendRemark
  }

  @override
  void getUserInfo({required String userId, required SyCallBack<SyContact> callback}) {
    // TODO: implement getUserInfo
  }

  @override
  Future<SyContact> getUserInfoFromCache(String userId) {
    // TODO: implement getUserInfoFromCache
    throw UnimplementedError();
  }

  @override
  Future<bool> isFriend(String userId) {
    // TODO: implement isFriend
    throw UnimplementedError();
  }}