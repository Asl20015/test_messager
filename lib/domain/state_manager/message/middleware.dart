import 'package:redux/redux.dart';
import 'package:test_messager/domain/repositories/message_repository.dart';
import 'package:test_messager/domain/state_manager/message/action.dart';
import 'package:test_messager/domain/state_manager/store.dart';

class MessageMiddleware implements MiddlewareClass<AppState> {
  final MessageRepository messageRepository;

  MessageMiddleware({required this.messageRepository});

  @override
  call(store, action, next) {
    // Message
    if (action is LoadMessageListAction) {
      Future(() async {
        final messages = await messageRepository.getMessageOfChat(userId: action.userId);
        store.dispatch(ShowMessageListAction(messages: messages));
      });
    }

    next(action);
  }
}
