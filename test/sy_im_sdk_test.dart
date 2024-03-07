import 'package:flutter_test/flutter_test.dart';
import 'package:sy_im_sdk/config/sy_options.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_auth_info.dart';

import 'package:sy_im_sdk/sy_client.dart';

import 'package:sy_im_sdk/channel/sy_im_sdk_platform_interface.dart';
import 'package:sy_im_sdk/channel/impl/sy_im_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSyImSdkPlatform
    with MockPlatformInterfaceMixin
    implements SyImSdkPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> init({required SyOptions syOptions}) {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> logOut({required SyCallBack<String> callback}) {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> loginByToken(
      {required String token, required SyCallBack<AuthInfo> callback}) {
    // TODO: implement loginByToken
    throw UnimplementedError();
  }

  @override
  Future<void> loginByUUID(
      {required String uuid, required SyCallBack<AuthInfo> callback}) {
    // TODO: implement loginByUUID
    throw UnimplementedError();
  }
}

void main() {
  final SyImSdkPlatform initialPlatform = SyImSdkPlatform.instance;

  test('$MethodChannelSyImSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSyImSdk>());
  });

  test('init', () async {
    MockSyImSdkPlatform fakePlatform = MockSyImSdkPlatform();
    SyImSdkPlatform.instance = fakePlatform;
    SyClient.getInstance().init();
  });
}
