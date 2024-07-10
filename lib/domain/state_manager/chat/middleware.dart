import 'package:redux/redux.dart';
import 'package:test_messager/data/mock/data_users.dart';
import 'package:test_messager/data/models/chat.dart';
import 'package:test_messager/domain/repositories/message_repository.dart';
import 'package:test_messager/domain/state_manager/chat/action.dart';
import 'package:test_messager/domain/state_manager/store.dart';

class ChatMiddleware implements MiddlewareClass<AppState> {
  final MessageRepository messageRepository;

  ChatMiddleware({required this.messageRepository});

  @override
  call(store, action, next) {
    // Chat
    if (action is LoadChatListAction) {
      Future(() async {
        final data = DataUsers();
        final chats = <Chat>[];
        for (var user in data.users) {
          final message = await messageRepository.getLastMessage(userId: user.id);
          chats.add(
            Chat(
              user: user,
              lastMessage: message,
            ),
          );
        }
        store.dispatch(ShowChatListAction(chats: chats));
      });
    }

    next(action);
  }
}
