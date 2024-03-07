import 'dart:ffi';

import '../common/session_type.dart';
import '../listener/sy_call_back.dart';
import '../listener/sy_conversation_listener.dart';
import 'data/sy_contact.dart';
import 'data/sy_conversation.dart';

abstract class ConversationManagerInterface {

  void addConversationListener(ConversationListener conversationListener);

  void removeConversationListener(ConversationListener conversationListener);

  /**
   * 获取当前登陆用户的会话列表
   */
  void getConversationList({required SyCallBack<List<SyConversation>> callback});

  /**
   * 创建群聊会话对象
   *
   * @param group 群对象
   * @see SyContact
   */
  void createSignConversationByUid(
      {required String uuid, required SyCallBack<SyConversation> callback});

  /**
   * 创建群聊会话对象
   *
   * @param group 群对象
   * @see SyContact
   */
  void createSignConversationByContact(
      {required SyContact contact,
      required SyCallBack<SyConversation> callback});

  /**
   * 移除会话
   *
   * @param sessionId
   */
  void removeConversation(
      {required String sessionId, required SyCallBack<bool> callback});

  /**
   * 设置会话是否置顶
   *
   * @param sessionId 会话ID
   * @param topping   是否置顶
   */
  void setConversationTopping(
      {required String sessionId,
      required topping,
      required SyCallBack<bool> callback});

  /**
   * 增加正在会话记录
   * 进入聊天页面时调用该接口
   *
   * @param sessionId 会话ID
   */
  void addChatting(String sessionId);

  /**
   * 退出聊天页面时调用
   *
   * @param sessionId 会话ID
   */
  void removeChatting(String sessionId);

  /**
   * 获取会话未读消息数
   */
  Long getUnReadNum(String sessionId);

  /**
   * 获取所有会话未读消息数
   *
   * @return
   */
  Long getAllUnReadNum();

  /**
   * 根据用户ID获取当前会话ID，仅私聊可用
   *
   * @param userId
   * @return
   */
  String getSessionIdByUserId(String userId);

  /**
   * 刷新会话未读消息数量
   * @param sessionId
   */
  void restUnReadCount(String sessionId);

  Long getAllUnReadNumBySessionType({required SessionType sessionType});
}
