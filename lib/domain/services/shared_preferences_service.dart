import 'package:shared_preferences/shared_preferences.dart';

class _SharedPreferencesKeys {
  static const initMessage = 'INIT_MESSAGE';
}

class SharedPreferencesService {
  //init message

  static Future<bool> setInitMessage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_SharedPreferencesKeys.initMessage, true);
  }

  static Future<bool> getInitMessage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_SharedPreferencesKeys.initMessage) ?? false;
  }
}
