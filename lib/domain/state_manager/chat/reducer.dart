import 'package:redux/redux.dart';
import 'package:test_messager/domain/state_manager/chat/action.dart';
import 'package:test_messager/domain/state_manager/chat/state.dart';

final chatListReducer = combineReducers<ChatListState>([
  TypedReducer<ChatListState, LoadChatListAction>(_loadChatList).call,
  TypedReducer<ChatListState, ShowChatListAction>(_showChatList).call,
  TypedReducer<ChatListState, ErrorChatListAction>(_errorChatList).call,
]);

// Chat
ChatListState _loadChatList(
  ChatListState state,
  LoadChatListAction action,
) =>
    state.copyWith(
      isLoading: true,
      isError: false,
    );

ChatListState _showChatList(
  ChatListState state,
  ShowChatListAction action,
) =>
    state.copyWith(
      isLoading: false,
      isError: false,
      chats: action.chats,
    );

ChatListState _errorChatList(
  ChatListState state,
  ErrorChatListAction action,
) =>
    state.copyWith(
      isLoading: false,
      isError: true,
      errorMessage: action.message,
    );
