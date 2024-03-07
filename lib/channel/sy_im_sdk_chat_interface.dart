import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/channel/impl/sy_im_sdk_chat_impl.dart';
import 'package:sy_im_sdk/channel/impl/sy_im_sdk_conversation_impl.dart';
import 'package:sy_im_sdk/config/sy_options.dart';
import 'package:sy_im_sdk/manager/data/conversation_info.dart';

import '../listener/sy_call_back.dart';
import '../manager/data/auth_info.dart';
import 'impl/sy_im_sdk_method_channel.dart';

abstract class SyImSdkChat extends PlatformInterface {
  /// Constructs a SyImSdkPlatform.
  SyImSdkChat() : super(token: _token);

  static final Object _token = Object();

  static SyImSdkChat _instance = SyImSdkChatImpl();

  /// The default instance of [SyImSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelSyImSdk].
  static SyImSdkChat get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SyImSdkPlatform] when
  /// they register themselves.
  static set instance(SyImSdkChat instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> sendMessage(
      {required String token,
      required SyCallBack<List<ConversationInfo>> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }



}
