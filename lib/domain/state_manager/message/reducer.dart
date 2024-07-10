import 'package:redux/redux.dart';
import 'package:test_messager/domain/state_manager/message/action.dart';
import 'package:test_messager/domain/state_manager/message/state.dart';

final messageListReducer = combineReducers<MessageListState>([
  TypedReducer<MessageListState, LoadMessageListAction>(_loadMessageList).call,
  TypedReducer<MessageListState, ShowMessageListAction>(_showMessageList).call,
  TypedReducer<MessageListState, ErrorMessageListAction>(_errorMessageList).call,
  TypedReducer<MessageListState, AddMessageListAction>(_addMessageList).call,
]);

// Message
MessageListState _addMessageList(
  MessageListState state,
  AddMessageListAction action,
) {
  final messages = state.messages.toList();
  messages.add(action.message);
  messages.sort((a, b) => b.created.compareTo(a.created));
  return state.copyWith(
    isLoading: false,
    isError: false,
    messages: messages,
  );
}

MessageListState _loadMessageList(
  MessageListState state,
  LoadMessageListAction action,
) =>
    state.copyWith(
      isLoading: true,
      isError: false,
    );

MessageListState _showMessageList(
  MessageListState state,
  ShowMessageListAction action,
) =>
    state.copyWith(
      isLoading: false,
      isError: false,
      messages: action.messages,
    );

MessageListState _errorMessageList(
  MessageListState state,
  ErrorMessageListAction action,
) =>
    state.copyWith(
      isLoading: false,
      isError: true,
      errorMessage: action.message,
    );
