
import 'package:get_it/get_it.dart';
import 'customfun.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CustomFunction());
}
