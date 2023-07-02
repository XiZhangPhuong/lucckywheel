import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  ///
  /// get String
  ///
  static Future<String?> getString(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

///
/// séttring
///
  static void setString(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}
}