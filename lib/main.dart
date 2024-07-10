import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:test_messager/domain/di/locator.dart';
import 'package:test_messager/domain/state_manager/store.dart';
import 'package:test_messager/routes.dart';
import 'package:test_messager/ui/resurses/theme.dart';
import 'package:test_messager/ui/screens/main/main_screen.dart';

void main() {
  final locator = LocatorService();
  runApp(MyApp(locator: locator));
}

class MyApp extends StatelessWidget {
  final LocatorService locator;

  const MyApp({
    super.key,
    required this.locator,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: locator.store,
      child: MaterialApp(
        title: 'TestMessage',
        navigatorKey: locator.navigatorKey,
        theme: theme,
        home: const MainScreen(),
        onGenerateRoute: AppRouter.onGenerateRouters,
      ),
    );
  }
}
