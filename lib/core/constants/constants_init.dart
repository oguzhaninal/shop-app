import 'package:piton_shop_list/core/init/init_shelf.dart';
import 'package:piton_shop_list/core/services/auth_services.dart';
import 'package:piton_shop_list/core/services/product_service.dart';

import '../core_shelf.dart';
import '../locator.dart';

final navigatonService = getIt<NavigationService>();
final authService = getIt<AuthService>();
final localManager = getIt<LocalManager>();
final productService = getIt<ProductService>();
String accessToken = '';
const apiUrl = 'https://assignment-api.piton.com.tr/api/v1';
