import 'package:test_messager/data/models/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessageOfChat({required int userId});

  Future<Message?> getLastMessage({required int userId});
}
