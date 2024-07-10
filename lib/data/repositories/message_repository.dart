import 'package:test_messager/data/database/database.dart';
import 'package:test_messager/data/models/message.dart';
import 'package:test_messager/domain/repositories/message_repository.dart';

class LocalMessageRepository implements MessageRepository {
  final AppDataBase database;

  LocalMessageRepository({required this.database});

  @override
  Future<List<Message>> getMessageOfChat({required int userId}) {
    return database.getListMessage(userId: userId);
  }

  @override
  Future<Message?> getLastMessage({required int userId}) {
    return database.getLastMessage(userId: userId);
  }
}
