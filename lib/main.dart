import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:patriots_parking/firebase_options.dart';
import 'package:patriots_parking/pages/home_page.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patriots Parking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint('You have an error! ${snapshot.error.toString()}');
            return const Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return ChangeNotifierProvider.value(
              value: locator.get<AppState>(),
              child: const HomePage(
                title: 'Parking Lot Sample',
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
