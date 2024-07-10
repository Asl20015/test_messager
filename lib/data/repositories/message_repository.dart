import 'package:test_messager/data/database/database.dart';
import 'package:test_messager/data/mock/messages/message_user_one.dart';
import 'package:test_messager/data/mock/messages/message_user_three.dart';
import 'package:test_messager/data/mock/messages/message_user_two.dart';
import 'package:test_messager/data/models/message.dart';
import 'package:test_messager/domain/repositories/message_repository.dart';
import 'package:test_messager/domain/services/shared_preferences_service.dart';

class LocalMessageRepository implements MessageRepository {
  final AppDataBase database;

  LocalMessageRepository({required this.database});

  @override
  Future<List<Message>> getMessageOfChat({required int userId}) {
    return database.getListMessage(userId: userId);
  }

  @override
  Future<Message?> getLastMessage({required int userId}) async {
    final isMessageInit = await SharedPreferencesService.getInitMessage();
    if (!isMessageInit) {
      await database.initMockMessage(mock: DataMessageUserOne());
      await database.initMockMessage(mock: DataMessageUserTwo());
      await database.initMockMessage(mock: DataMessageUserThree());
      await SharedPreferencesService.setInitMessage();
    }
    return database.getLastMessage(userId: userId);
  }

  @override
  Future<Message> createMessage({
    required int userId,
    required String content,
    required List<String> files,
  }) {
    return database.createMessage(
      text: content,
      files: files,
      companionId: userId,
    );
  }
}
