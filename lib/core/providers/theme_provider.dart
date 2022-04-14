import 'package:flutter/material.dart';
import '../core_shelf.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = getDarkTheme();
  static final ThemeProvider _instance = ThemeProvider();
  static ThemeProvider get instance => _instance;

  ThemeData get theme => _instance._themeData;

  set theme(ThemeData themeData) {
    _instance._themeData = themeData;
    notifyListeners();
  }

  changeTheme(ThemeData themeData) {
    _instance._themeData = themeData;
    notifyListeners();
  }

  Future<void> fetchLocale() async {
    final isDark = await LocalManager.instance.getBoolValue(LocalManagerKeys.darkMode);
    if (!isDark) {
      _instance._themeData = getLightTheme();
      _themeData = getLightTheme();
    } else {
      _instance._themeData = getDarkTheme();
      _themeData = getDarkTheme();
    }
  }

  bool isDark() {
    return _instance.theme == getDarkTheme();
  }
}
