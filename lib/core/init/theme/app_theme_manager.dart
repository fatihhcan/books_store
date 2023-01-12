import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';
import 'app_colors.dart';
import 'text_theme.dart';

class AppThemeManager extends AppTheme {
  static AppThemeManager? _instance;
  static AppThemeManager get instance {
    return _instance ??= AppThemeManager._init();
  }

  AppThemeManager._init();

  @override
  ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightColors().white,
      backgroundColor: LightColors().white,
      fontFamily: GoogleFonts.manrope().fontFamily,
      textTheme: TextThemeManager.instance.textTheme(),
     );


}
