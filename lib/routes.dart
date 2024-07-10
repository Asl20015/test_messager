import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_messager/data/models/user.dart';
import 'package:test_messager/ui/screens/chat/chat_screen.dart';
import 'package:test_messager/ui/screens/file/image_screen.dart';

class AppRouter {
  static const String chat = '/chat';
  static const String image = '/image';

  static MaterialPageRoute onGenerateRouters(RouteSettings settings) {
    final args = settings.arguments as AppRouterArguments?;

    final routes = <String, WidgetBuilder>{
      AppRouter.chat: (BuildContext context) => ChatScreen(user: args!.user!),
      AppRouter.image: (BuildContext context) => ImageScreen(file: args!.file!),
    };

    WidgetBuilder? builder = routes[settings.name!];
    return MaterialPageRoute(builder: (ctx) => builder!(ctx));
  }
}

class AppRouterArguments {
  final User? user;
  final File? file;

  AppRouterArguments({
    this.user,
    this.file,
  });
}
