import 'package:test_messager/data/models/message.dart';

abstract class MessageListAction {}

class LoadMessageListAction extends MessageListAction {
  final int userId;

  LoadMessageListAction({required this.userId});
}

class ShowMessageListAction extends MessageListAction {
  final List<Message> messages;

  ShowMessageListAction({required this.messages});
}

class ErrorMessageListAction extends MessageListAction {
  final String message;

  ErrorMessageListAction({required this.message});
}
