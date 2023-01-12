import 'package:flutter/material.dart';

import 'package:books_store/core/extensions/string_extensions.dart';

abstract class AppColors {
  //Unique Colors

  Color white = 'FFFFFF'.color;
  Color burntSienna = 'EF6B4A'.color;
  Color royalBlue = '6251DD'.color;
  Color titanWhite = 'F4F4FF'.color;
  Color violet = '090937'.color;
  Color portGore = '201C4C'.color;

  //Overrided Colors

  late Color scaffoldBackgroundColor;
  late Color selectCategoryBackgroundColor;
  late Color disableCategoryBackgroundColor;
  late Color splashBackgroundColor;
  late Color buttonBackgroundColor;
  late Color titleColor;
}

class LightColors extends AppColors {
  @override
  Color get scaffoldBackgroundColor => white;

  @override
  Color get selectCategoryBackgroundColor => royalBlue;

  @override
  Color get disableCategoryBackgroundColor => titanWhite;

  @override
  Color get buttonBackgroundColor => burntSienna;

  @override
  Color get splashBackgroundColor => burntSienna;

  @override
  Color get titleColor => violet;
}

