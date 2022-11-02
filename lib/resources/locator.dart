import 'package:get_it/get_it.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firebase/auth_methods.dart';
import 'package:patriots_parking/resources/firebase/firestore_methods.dart';

final locator = GetIt.instance;

// create singletons for files
setUpLocator() {
  locator.registerLazySingleton<AppState>(() => AppState());
  locator.registerLazySingleton<AuthMethods>(() => AuthMethods());
  locator.registerLazySingleton<FirestoreMethods>(() => FirestoreMethods());
}
