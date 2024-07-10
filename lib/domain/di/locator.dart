import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_messager/domain/services/navigator_service.dart';

class LocatorService {
  final navigatorKey = GlobalKey<NavigatorState>();
  late NavigatorService navigatorService;

  LocatorService() {
    navigatorService = NavigatorService(navigatorKey: navigatorKey);

    _register();
  }

  void _register() {
    GetIt.I.registerSingleton<NavigatorService>(navigatorService);
  }
}
