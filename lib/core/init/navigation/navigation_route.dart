import 'package:flutter/material.dart';
import 'package:piton_shop_list/views/auth/auth_view.dart';
import 'package:piton_shop_list/views/auth/login/login_view.dart';
import 'package:piton_shop_list/views/settings/settings_view.dart';

import '../../../views/main_screen.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.settings:
        return normalNavigate(Settings());
      case NavigationConstants.login:
        return normalNavigate(AuthView());

      default:
        return normalNavigate(AuthView());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
