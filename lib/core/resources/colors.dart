import 'package:flutter/material.dart';

class ColorsApp {
  static const String hexGreenApp = "06bea6";

  static final Color greenApp = hexToColor(hexGreenApp);

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
