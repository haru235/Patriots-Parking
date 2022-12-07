import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:patriots_parking/firebase_options.dart';
import 'package:patriots_parking/pages/parking_page.dart';
import 'package:patriots_parking/pages/welcome_page.dart';
import 'package:patriots_parking/resources/app_state.dart';
import 'package:patriots_parking/resources/firebase/auth_methods.dart';
import 'package:patriots_parking/resources/locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        primaryColor: Colors.blue[900],
      ),
      home: StreamBuilder(
        stream: locator.get<AuthMethods>().userStream,
        builder: (context, snapshot) {
          // if user logged in
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              // return home page if connection successful
              return ChangeNotifierProvider.value(
                value: locator.get<AppState>(),
                child: const HomePage(
                  title: 'Patriots Parking',
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // return login screen if user not logged in
          return const WelcomePage();
        },
      ),
    );
  }
}
