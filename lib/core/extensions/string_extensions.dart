import 'package:flutter/material.dart';

extension SVGImagePathExtension on String {
  String get toSVG => 'assets/images/$this.svg';
}

extension StringColorExtension on String {
  Color get color => Color(int.parse('0xff$this'));
}
