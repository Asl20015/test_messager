import 'package:test_messager/data/models/chat.dart';
import 'package:test_messager/data/models/message.dart';

abstract class ChatRepository {
  Future<List<Chat>> getListChat();

  Future<List<Message>> getMessageOfChat({required int userId});
}
