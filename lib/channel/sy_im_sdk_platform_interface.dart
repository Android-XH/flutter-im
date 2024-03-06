import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/config/sy_options.dart';

import '../listener/sy_call_back.dart';
import '../manager/data/auth_info.dart';
import 'impl/sy_im_sdk_method_channel.dart';

abstract class SyImSdkPlatform extends PlatformInterface {
  /// Constructs a SyImSdkPlatform.
  SyImSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static SyImSdkPlatform _instance = MethodChannelSyImSdk();

  /// The default instance of [SyImSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelSyImSdk].
  static SyImSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SyImSdkPlatform] when
  /// they register themselves.
  static set instance(SyImSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> init({required SyOptions syOptions}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> loginByUUID(
      {required String uuid, required SyCallBack<AuthInfo> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> loginByToken(
      {required String token, required SyCallBack<AuthInfo> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> logOut({required SyCallBack<String> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
