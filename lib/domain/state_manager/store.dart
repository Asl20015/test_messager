import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_messager/domain/state_manager/chat/state.dart';
import 'package:test_messager/domain/state_manager/message/state.dart';

part 'store.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required ChatListState chatListState,
    required MessageListState messageListState,
  }) = _AppState;
}
