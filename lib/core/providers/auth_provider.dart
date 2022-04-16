import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _currentPage = 'login';
  String get currentPage => _currentPage;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  void setCurrenPage(String newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
