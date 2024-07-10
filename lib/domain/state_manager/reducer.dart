import 'package:test_messager/domain/state_manager/chat/action.dart';
import 'package:test_messager/domain/state_manager/chat/reducer.dart';
import 'package:test_messager/domain/state_manager/message/action.dart';
import 'package:test_messager/domain/state_manager/message/reducer.dart';
import 'package:test_messager/domain/state_manager/store.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is ChatListAction) {
    final nextState = chatListReducer(state.chatListState, action);
    return state.copyWith(chatListState: nextState);
  } else if (action is MessageListAction) {
    final nextState = messageListReducer(state.messageListState, action);
    return state.copyWith(messageListState: nextState);
  }
  return state;
}
