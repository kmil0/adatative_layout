import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _themeMode;
  ThemeChanger(this._themeMode);

  themeMode() => _themeMode;

  setTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
  }
}
