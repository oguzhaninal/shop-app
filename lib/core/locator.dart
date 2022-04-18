import 'package:get_it/get_it.dart';
import 'package:piton_shop_list/core/core_shelf.dart';
import 'package:piton_shop_list/core/services/auth_services.dart';
import 'package:piton_shop_list/core/services/product_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService.instance);
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => LocalManager.instance);
  getIt.registerLazySingleton(() => ProductService());
}
