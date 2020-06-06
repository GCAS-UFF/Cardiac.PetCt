import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  getThemeData() {
    if (_themeData == ThemeData.dark()) {
      return true;
    } else {
      return false;
    }
  }

  changeTheme() {
    if (_themeData == ThemeData.light()) {
      _themeData = ThemeData.dark();
    } else {
      _themeData = ThemeData.light();
    }
    notifyListeners();
  }
}
