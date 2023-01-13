import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  static late SharedPreferences _prefs;
    static initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  static Future<void> setToken(String token) async {
    _prefs.setString('token', token);
  }

  static Future<void> clearCache() async {
    _prefs.clear();
  }

 
  static String get getToken => _prefs.getString('token') ?? "";

}
