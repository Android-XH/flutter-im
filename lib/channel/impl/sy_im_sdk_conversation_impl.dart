
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sy_im_sdk/channel/sy_im_sdk_conversation_interface.dart';
import 'package:sy_im_sdk/common/channel_common.dart';

import '../sy_im_sdk_platform_interface.dart';

/// An implementation of [SyImSdkPlatform] that uses method channels.
class SyImSdkConversationImpl extends SyImSdkConversation {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel(ChannelCommon.syClientMethodChannel);



}
