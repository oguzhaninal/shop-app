import 'package:flutter/cupertino.dart';

abstract class INavigationService {
  Future<void> navigateToPage({String path, Object data});
  Future<void> navigateToPageClear(Widget route);
}
