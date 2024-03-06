import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sy_im_sdk/common/channel_common.dart';
import 'package:sy_im_sdk/common/sy_client_method_common.dart';
import 'package:sy_im_sdk/config/sy_options.dart';

import '../../listener/sy_call_back.dart';
import '../../manager/data/auth_info.dart';
import '../sy_im_sdk_platform_interface.dart';

/// An implementation of [SyImSdkPlatform] that uses method channels.
class MethodChannelSyImSdk extends SyImSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel(ChannelCommon.syClientMethodChannel);

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> init({required SyOptions syOptions}) async {
    Map<String, String> arguments = <String, String>{};
    String optionsJson = jsonEncode(syOptions.toJson());
    arguments.putIfAbsent("optionsJson", () => optionsJson);
    arguments.putIfAbsent("environment", () => syOptions.environment.toJson());
    return methodChannel.invokeMethod<void>(
        SyClientMethodCommon.init, arguments);
  }

  @override
  Future<void> loginByUUID(
      {required String uuid, required SyCallBack<AuthInfo> callback}) async {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("uuid", () => uuid);
    methodChannel
        .invokeMethod<String>(SyClientMethodCommon.loginByAccountId, arguments)
        .then((value) => callback.onSuccess
            .call(AuthInfo.fromJson(jsonDecode(value.toString()))))
        .catchError((e) => callback.onFail.call(e.code, e.message!));
  }

  @override
  Future<void> loginByToken(
      {required String token, required SyCallBack<AuthInfo> callback}) async {
    Map<String, String> arguments = <String, String>{};
    arguments.putIfAbsent("token", () => token);
    methodChannel
        .invokeMethod<String>(SyClientMethodCommon.loginByToken, arguments)
        .then((value) => callback.onSuccess
            .call(AuthInfo.fromJson(jsonDecode(value.toString()))))
        .catchError((e) => callback.onFail.call(e.code, e.message!));
  }

  @override
  Future<void> logOut({required SyCallBack<String> callback}) async {
    return methodChannel.invokeMethod<void>(SyClientMethodCommon.logout);
  }
}
