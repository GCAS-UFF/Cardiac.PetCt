import 'package:flutter/material.dart';

class ColorsApp {
  static const String hexGreenApp = "06bea6";
  static const String hexDarkBackground = "2e2e2e";
  static const String hexLightBackground = "fafafa";
  static const String hexDangerRed = "C73E33";
  static const String hexSuccessGreen = "28C51A";

  static final Color greenApp = hexToColor(hexGreenApp);
  static final Color darkBackground = hexToColor(hexDarkBackground);
  static final Color lightBackground = hexToColor(hexLightBackground);
  static final Color dangerRed = hexToColor(hexDangerRed);
  static final Color successGreen = hexToColor(hexSuccessGreen);

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
