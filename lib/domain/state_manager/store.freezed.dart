// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  ChatListState get chatListState => throw _privateConstructorUsedError;
  MessageListState get messageListState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({ChatListState chatListState, MessageListState messageListState});

  $ChatListStateCopyWith<$Res> get chatListState;
  $MessageListStateCopyWith<$Res> get messageListState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatListState = null,
    Object? messageListState = null,
  }) {
    return _then(_value.copyWith(
      chatListState: null == chatListState
          ? _value.chatListState
          : chatListState // ignore: cast_nullable_to_non_nullable
              as ChatListState,
      messageListState: null == messageListState
          ? _value.messageListState
          : messageListState // ignore: cast_nullable_to_non_nullable
              as MessageListState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatListStateCopyWith<$Res> get chatListState {
    return $ChatListStateCopyWith<$Res>(_value.chatListState, (value) {
      return _then(_value.copyWith(chatListState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageListStateCopyWith<$Res> get messageListState {
    return $MessageListStateCopyWith<$Res>(_value.messageListState, (value) {
      return _then(_value.copyWith(messageListState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChatListState chatListState, MessageListState messageListState});

  @override
  $ChatListStateCopyWith<$Res> get chatListState;
  @override
  $MessageListStateCopyWith<$Res> get messageListState;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatListState = null,
    Object? messageListState = null,
  }) {
    return _then(_$AppStateImpl(
      chatListState: null == chatListState
          ? _value.chatListState
          : chatListState // ignore: cast_nullable_to_non_nullable
              as ChatListState,
      messageListState: null == messageListState
          ? _value.messageListState
          : messageListState // ignore: cast_nullable_to_non_nullable
              as MessageListState,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {required this.chatListState, required this.messageListState});

  @override
  final ChatListState chatListState;
  @override
  final MessageListState messageListState;

  @override
  String toString() {
    return 'AppState(chatListState: $chatListState, messageListState: $messageListState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.chatListState, chatListState) ||
                other.chatListState == chatListState) &&
            (identical(other.messageListState, messageListState) ||
                other.messageListState == messageListState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatListState, messageListState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required final ChatListState chatListState,
      required final MessageListState messageListState}) = _$AppStateImpl;

  @override
  ChatListState get chatListState;
  @override
  MessageListState get messageListState;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
