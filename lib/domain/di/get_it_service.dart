import 'package:get_it/get_it.dart';
import 'package:test_messager/domain/services/navigator_service.dart';

class GetItServices {
  NavigatorService get navigatorService => GetIt.I.get<NavigatorService>();
}

final getItService = GetItServices();
