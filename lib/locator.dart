import 'package:flutterappdemo/providers/dashboard_provider.dart';
import 'package:flutterappdemo/services/api_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiService());
  // ignore: cascade_invocations
  locator.registerFactory(() => DashBoardRepoProvider());
}
