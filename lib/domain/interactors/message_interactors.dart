import 'package:redux/redux.dart';
import 'package:test_messager/domain/repositories/message_repository.dart';
import 'package:test_messager/domain/state_manager/chat/action.dart';
import 'package:test_messager/domain/state_manager/message/action.dart';
import 'package:test_messager/domain/state_manager/store.dart';

class MessageInteractors {
  final MessageRepository messageRepository;
  final Store<AppState> store;

  MessageInteractors({
    required this.messageRepository,
    required this.store,
  });

  Future<void> createMessage({
    required int userId,
    required String content,
    required List<String> files,
  }) async {
    final message = await messageRepository.createMessage(
      userId: userId,
      content: content,
      files: files,
    );

    store.dispatch(AddMessageListAction(message: message));
    store.dispatch(LoadChatListAction());
  }
}
