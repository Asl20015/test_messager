import 'package:flutter/material.dart';
import 'package:test_messager/data/models/user.dart';
import 'package:test_messager/ui/screens/chat_screen.dart';

class AppRouter {
  static const String chat = '/chat';

  static MaterialPageRoute onGenerateRouters(RouteSettings settings) {
    final args = settings.arguments as AppRouterArguments?;

    final routes = <String, WidgetBuilder>{
      AppRouter.chat: (BuildContext context) => ChatScreen(user: args!.user!),
    };

    WidgetBuilder? builder = routes[settings.name!];
    return MaterialPageRoute(builder: (ctx) => builder!(ctx));
  }
}

class AppRouterArguments {
  final User? user;

  AppRouterArguments({
    this.user,
  });
}
