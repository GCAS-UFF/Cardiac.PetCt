import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeData _themeDataLight =
      ThemeData(brightness: Brightness.light, primarySwatch: color);
  ThemeData _themeDataDark =
      ThemeData(brightness: Brightness.dark, primarySwatch: color);

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  getThemeData() {
    if (_themeData.brightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  changeTheme() {
    if (_themeData.brightness == Brightness.light) {
      _themeData = _themeDataDark;
    } else {
      _themeData = _themeDataLight;
    }
    notifyListeners();
  }
}

MaterialColor color = MaterialColor(
  0xFF06BEA6,
  <int, Color>{
    50: Color(0xFF06BEA6),
    100: Color(0xFF06BEA6),
    200: Color(0xFF06BEA6),
    300: Color(0xFF06BEA6),
    400: Color(0xFF06BEA6),
    500: Color(0xFF06BEA6),
    600: Color(0xFF06BEA6),
    700: Color(0xFF06BEA6),
    800: Color(0xFF06BEA6),
    900: Color(0xFF06BEA6),
  },
);
