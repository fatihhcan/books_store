class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    return _instance ??= ImageConstants._init();
  }

  ImageConstants._init();

  String get splashLogo => toPng('logo_200x130px');
  String get authLogo => toPng('logo_100x65px');


  String toPng(String name) => 'assets/images/$name.png';
}
