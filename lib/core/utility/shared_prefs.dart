import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  static late SharedPreferences _prefs;
    static initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  static Future<void> setToken(String token) async {
    _prefs.setString('token', token);
  }
  static Future<void> setUserId(int userId) async {
    _prefs.setInt('userId', userId);
  }

  static Future<void> clearCache() async {
    _prefs.clear();
  }

 
  static String get getToken => _prefs.getString('token') ?? "";
  static int get getUserId => _prefs.getInt('userId') ?? 0;

}
