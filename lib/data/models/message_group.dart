import 'package:test_messager/data/models/message.dart';

class MessageGroup {
  final DateTime date;
  final List<Message> messages;

  MessageGroup({
    required this.date,
    required this.messages,
  });
}
