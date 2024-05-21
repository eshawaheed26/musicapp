import 'package:flutter/material.dart';
import 'package:mymusicapp/themes/darkmode.dart';
import 'package:mymusicapp/themes/lightmode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightmode;
  ThemeData get themeData => _themeData;
  bool get isdarkmode => _themeData == darkmode;

  set themeData (ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}