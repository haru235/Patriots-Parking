import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// stream of user data
  Stream<User?>? get userStream {
    return _auth.authStateChanges();
  }

  User get currentUser {
    return _auth.currentUser!;
  }

  String get uid => _auth.currentUser != null ? _auth.currentUser!.uid : '';

  Future<void> signout() async {
    await _auth.signOut();
  }
}
