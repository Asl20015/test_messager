import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:test_messager/data/database/database.dart';
import 'package:test_messager/data/repositories/message_repository.dart';
import 'package:test_messager/domain/repositories/message_repository.dart';
import 'package:test_messager/domain/services/navigator_service.dart';
import 'package:test_messager/domain/state_manager/chat/middleware.dart';
import 'package:test_messager/domain/state_manager/chat/state.dart';
import 'package:test_messager/domain/state_manager/message/middleware.dart';
import 'package:test_messager/domain/state_manager/message/state.dart';
import 'package:test_messager/domain/state_manager/reducer.dart';
import 'package:test_messager/domain/state_manager/store.dart';

class LocatorService {
  final navigatorKey = GlobalKey<NavigatorState>();
  final database = AppDataBase();
  late Store<AppState> store;

  late NavigatorService navigatorService;

  late MessageRepository messageRepository;

  LocatorService() {
    navigatorService = NavigatorService(navigatorKey: navigatorKey);

    messageRepository = LocalMessageRepository(database: database);

    store = Store(
      appReducer,
      initialState: AppState(
        chatListState: ChatListState(),
        messageListState: MessageListState(),
      ),
      middleware: [
        ChatMiddleware(messageRepository: messageRepository).call,
        MessageMiddleware(messageRepository: messageRepository).call,
      ],
    );

    _register();
  }

  void _register() {
    GetIt.I.registerSingleton<NavigatorService>(navigatorService);
  }
}
