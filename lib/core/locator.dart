import 'package:get_it/get_it.dart';
import 'package:piton_shop_list/core/core_shelf.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService.instance);
}
