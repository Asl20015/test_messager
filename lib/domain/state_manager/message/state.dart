import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_messager/data/models/message.dart';

part 'state.freezed.dart';

@freezed
class MessageListState with _$MessageListState {
  factory MessageListState([
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    int? companionId,
    @Default([]) List<Message> messages,
  ]) = _MessageListState;
}
