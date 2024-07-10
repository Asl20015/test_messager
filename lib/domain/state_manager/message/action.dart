import 'package:test_messager/data/models/message.dart';

abstract class MessageListAction {}

class LoadMessageListAction extends MessageListAction {
  final int userId;

  LoadMessageListAction({required this.userId});
}

class ShowMessageListAction extends MessageListAction {
  final List<Message> messages;
  final int userId;

  ShowMessageListAction({
    required this.messages,
    required this.userId,
  });
}

class AddMessageListAction extends MessageListAction {
  final Message message;

  AddMessageListAction({required this.message});
}

class ErrorMessageListAction extends MessageListAction {
  final String message;

  ErrorMessageListAction({required this.message});
}
