import 'package:test_messager/data/models/chat.dart';
import 'package:test_messager/data/models/message.dart';
import 'package:test_messager/domain/repositories/chat_repository.dart';

class LocalChatRepository implements ChatRepository {
  @override
  Future<List<Chat>> getListChat() {
    // TODO: implement getListChat
    throw UnimplementedError();
  }

  @override
  Future<List<Message>> getMessageOfChat({required int userId}) {
    // TODO: implement getMessageOfChat
    throw UnimplementedError();
  }
}
