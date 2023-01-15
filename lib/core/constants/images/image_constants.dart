class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    return _instance ??= ImageConstants._init();
  }

  ImageConstants._init();

  String get splashLogo => toPng( 'images','logo_200x130px');
  String get authLogo => toPng('images','logo_100x65px');
  String get homeLogo => toPng('images','logo_50x32px');

  String get filterIcon => toPng('icons','filter_icon');
  String get searchIcon => toPng('icons','search_icon');
  String get backIcon => toPng('icons','back_icon');
  String get favoriteFillIcon => toPng('icons','favorite_fill_icon');
  String get favoriteIcon => toPng('icons','favorite_icon');
  


  String toPng(String path, String name) => 'assets/$path/$name.png';
}
