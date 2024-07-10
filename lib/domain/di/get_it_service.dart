import 'package:get_it/get_it.dart';
import 'package:test_messager/domain/interactors/message_interactors.dart';
import 'package:test_messager/domain/services/navigator_service.dart';

class GetItServices {
  NavigatorService get navigatorService => GetIt.I.get<NavigatorService>();

  MessageInteractors get messageInteractors => GetIt.I.get<MessageInteractors>();
}

final getItService = GetItServices();
