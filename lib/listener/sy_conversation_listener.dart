import 'package:sy_im_sdk/manager/data/sy_conversation.dart';

class ConversationListener{
  final void Function(List<SyConversation>) onChanger;
  ConversationListener(this.onChanger);
}