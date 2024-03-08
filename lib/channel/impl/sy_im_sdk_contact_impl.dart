import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';

import '../../common/channel_common.dart';
import '../../common/sy_client_method_common.dart';
import '../../manager/data/sy_conversation.dart';
import '../sy_im_sdk_contact_interface.dart';

class SyImSdkContactImpl extends SyImSdkContact {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(ChannelCommon.syClientMethodChannel);

  @override
  void addFriend({required String userId, SyCallBack<bool>? callback}) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("userId", () => userId);
    methodChannel
        .invokeMethod(SyClientMethodCommon.addFriend, arguments)
        .then((value) =>
        callback?.onSuccess(value))
        .catchError((e) => callback?.onFail.call(e.code, e.message!));
  }

  @override
  void deleteFriend({required String userId, SyCallBack<bool>? callback}) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("userId", () => userId);
    methodChannel
        .invokeMethod(SyClientMethodCommon.deleteFriend, arguments)
        .then((value) =>
        callback?.onSuccess(value))
        .catchError((e) => callback?.onFail.call(e.code, e.message!));
  }

  @override
  void editFriendRemark({required String userId,required String remark, SyCallBack<bool>? callback}) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("userId", () => userId);
    arguments.putIfAbsent("remark", () => remark);
    methodChannel
        .invokeMethod(SyClientMethodCommon.editFriendRemark, arguments)
        .then((value) =>
        callback?.onSuccess(value))
        .catchError((e) => callback?.onFail.call(e.code, e.message!));
  }

  @override
  void getUserInfo({required String userId, required SyCallBack<SyContact> callback}) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("userId", () => userId);
    methodChannel
        .invokeMethod(SyClientMethodCommon.getUserInfo, arguments)
        .then((value) =>
          callback.onSuccess(SyContact.fromJson(value)))
        .catchError((e) => callback.onFail.call(e.code, e.message!));
  }

  @override
  Future<dynamic> getUserInfoFromCache(String userId) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("userId", () => userId);
   return  methodChannel.invokeMethod(SyClientMethodCommon.getUserInfoFromCache, arguments);
  }

  @override
  Future<dynamic> isFriend(String userId) {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("userId", () => userId);
    return  methodChannel.invokeMethod(SyClientMethodCommon.isFriend, arguments);
  }}