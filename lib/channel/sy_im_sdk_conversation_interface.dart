import 'dart:ffi';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sy_im_sdk/channel/impl/sy_im_sdk_conversation_impl.dart';
import 'package:sy_im_sdk/config/sy_options.dart';

import '../common/session_type.dart';
import '../listener/sy_call_back.dart';
import '../manager/data/sy_contact.dart';
import '../manager/data/sy_conversation.dart';

import '../manager/data/sy_message.dart';
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

  /**
   * 获取当前登陆用户的会话列表
   */
  void getConversationList(
      {required SyCallBack<List<SyConversation>> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 创建群聊会话对象
   *
   * @param group 群对象
   * @see SyContact
   */
  void createSignConversationByUid(
      {required String uuid, required SyCallBack<SyConversation> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 创建群聊会话对象
   *
   * @param group 群对象
   * @see SyContact
   */
  void createSignConversationByContact(
      {required SyContact contact,
      required SyCallBack<SyConversation> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 移除会话
   *
   * @param sessionId
   */
  void removeConversation(
      {required String sessionId, required SyCallBack<bool> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 设置会话是否置顶
   *
   * @param sessionId 会话ID
   * @param topping   是否置顶
   */
  void setConversationTopping(
      {required String sessionId,
      required topping,
      required SyCallBack<bool> callback}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 增加正在会话记录
   * 进入聊天页面时调用该接口
   *
   * @param sessionId 会话ID
   */
  void addChatting(String sessionId) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 退出聊天页面时调用
   *
   * @param sessionId 会话ID
   */
  void removeChatting(String sessionId) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 获取会话未读消息数
   */
  Future<dynamic> getUnReadNum(String sessionId) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 获取所有会话未读消息数
   *
   * @return
   */
  Future<dynamic> getAllUnReadNum() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 根据用户ID获取当前会话ID，仅私聊可用
   *
   * @param userId
   * @return
   */
  Future<dynamic> getSessionIdByUserId(String userId) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /**
   * 刷新会话未读消息数量
   * @param sessionId
   */
  void restUnReadCount(String sessionId) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<dynamic> getAllUnReadNumBySessionType({required SessionType sessionType}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
