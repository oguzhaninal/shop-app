import 'package:flutter/material.dart';
import 'I_navigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (route) => false;

  Future<dynamic> navigateTo(Widget route) {
    return navigatorKey.currentState!.push(MaterialPageRoute(builder: (_) => route));
  }

  @override
  Future<void> navigateToPage({String path = '/', Object data = const {}}) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear(Widget route) async {
    await navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => route), (route) => false);
  }
}
