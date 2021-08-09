import 'package:shared_preferences/shared_preferences.dart';

import '../../screens.dart';

class AuthKeyStorage {
  static SharedPreferences? prefs;
  static setValue({required String key}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("token", key);
  }

  static getValue() async {
    final AuthController authController = AuthController.to;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    authController.authToken.value = preferences.getString("token") ?? " ";
  }
}
