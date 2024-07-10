import 'package:test_messager/data/models/chat.dart';

abstract class ChatListAction {}

class LoadChatListAction extends ChatListAction {}

class ShowChatListAction extends ChatListAction {
  final List<Chat> chats;

  ShowChatListAction({required this.chats});
}

class ErrorChatListAction extends ChatListAction {
  final String message;

  ErrorChatListAction({required this.message});
}