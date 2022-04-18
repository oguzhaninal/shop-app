import 'package:flutter/material.dart';
import '../../../core/core_shelf.dart';

class AuthProvider extends ChangeNotifier {
  LoadingState _loadingState = LoadingState.Initial;
  LoadingState get loadingState => _loadingState;

  String _currentPage = 'login';
  String get currentPage => _currentPage;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  bool _isEmail = true;
  bool get isEmail => _isEmail;

  bool _isEmailLogin = true;
  bool get isEmailLogin => _isEmail;

  bool _isPassValidated = true;
  bool get isPassValidated => _isPassValidated;

  bool _isPassesSame = true;
  bool get isPassesSame => _isPassesSame;

  bool _isPhoneTrue = true;
  bool get isPhoneTrue => _isPhoneTrue;

  bool _isNameEmpty = false;
  bool get isNameEmpty => _isNameEmpty;

  void setNameStatus(String value) {
    _isNameEmpty = value.isEmpty;
    notifyListeners();
  }

  Future<void> setPhoneValidate(int value) async {
    if (value != 19) {
      _isPhoneTrue = false;
    } else {
      _isPhoneTrue = true;
    }
    notifyListeners();
  }

  void checkPassIsSame(String pass1, String pass2) {
    _isPassesSame = pass1 == pass2;
    notifyListeners();
  }

  void passValid(String value) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$';
    RegExp regExp = RegExp(pattern);
    _isPassValidated = regExp.hasMatch(value);
    notifyListeners();
  }

  void emailValidate(String em, bool isLogin) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    if (isLogin) {
      _isEmailLogin = regExp.hasMatch(em);
    }
    _isEmail = regExp.hasMatch(em);

    notifyListeners();
  }

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  void setCurrenPage(String newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
