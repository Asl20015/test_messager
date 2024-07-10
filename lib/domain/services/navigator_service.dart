import 'package:flutter/material.dart';
import 'package:test_messager/data/models/user.dart';
import 'package:test_messager/routes.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorService({required this.navigatorKey});

  void onPop() => navigatorKey.currentState!.pop();

  void onChat({required User user}) {
    navigatorKey.currentState!.pushNamed(
      AppRouter.chat,
      arguments: AppRouterArguments(user: user),
    );
  }
}
