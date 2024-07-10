import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_messager/data/models/chat.dart';

part 'state.freezed.dart';

@freezed
class ChatListState with _$ChatListState {
  factory ChatListState([
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default([]) List<Chat> chats,
  ]) = _ChatListState;
}
