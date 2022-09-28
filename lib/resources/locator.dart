import 'package:get_it/get_it.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firestore_methods.dart';

final locator = GetIt.instance;

// create singletons for files
setUpLocator() {
  locator.registerLazySingleton<AppState>(() => AppState());
  locator.registerLazySingleton<FirestoreMethods>(() => FirestoreMethods());
}
