import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/channel/impl/sy_im_sdk_conversation_impl.dart';
import 'package:sy_im_sdk/config/sy_options.dart';

import '../listener/sy_call_back.dart';
import '../manager/data/sy_conversation.dart';

import 'impl/sy_im_sdk_method_channel.dart';

abstract class SyImSdkConversation extends PlatformInterface {
  SyImSdkConversation() : super(token: _token);

  static final Object _token = Object();

  static SyImSdkConversation _instance = SyImSdkConversationImpl();

  /// The default instance of [SyImSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelSyImSdk].
  static SyImSdkConversation get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SyImSdkPlatform] when
  /// they register themselves.
  static set instance(SyImSdkConversation instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> getConversationList(
      {required String uuid,
      required SyCallBack<List<SyConversation>> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> createSignConversation({required String uuid,required SyCallBack<SyConversation> callback}){
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

}
