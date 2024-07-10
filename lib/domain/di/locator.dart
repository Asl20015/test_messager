import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_messager/data/database/database.dart';
import 'package:test_messager/data/repositories/message_repository.dart';
import 'package:test_messager/domain/repositories/message_repository.dart';
import 'package:test_messager/domain/services/navigator_service.dart';

class LocatorService {
  final navigatorKey = GlobalKey<NavigatorState>();
  final database = AppDataBase();

  late NavigatorService navigatorService;

  late MessageRepository messageRepository;

  LocatorService() {
    navigatorService = NavigatorService(navigatorKey: navigatorKey);

    messageRepository = LocalMessageRepository(database: database);

    _register();
  }

  void _register() {
    GetIt.I.registerSingleton<NavigatorService>(navigatorService);
  }
}
