
String apiAccessToken = '';
class AppStateManager {
  static AppStateManager? _instance;
  static AppStateManager get instance {
    return _instance ??= AppStateManager.init();
  }

  String accessToken = apiAccessToken;

  List<dynamic> cityList = [];


  AppStateManager.init();
}
