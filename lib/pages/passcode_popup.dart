import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/firebase/firestore_methods.dart';
import 'package:patriots_parking/resources/locator.dart';

class PassCode extends StatefulWidget {
  const PassCode({super.key});

  @override
  State<PassCode> createState() => _PassCodeState();
}

class _PassCodeState extends State<PassCode> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

// popup to enter passcode for admin access
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enter passcode: "),
      content: TextField(
        controller: _controller,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
        onSubmitted: (value) async {
          Navigator.pop(context);
          if (value == "ppadmin235") {
            await locator.get<FirestoreMethods>().toggleAdmin(true);
          }
        },
      ),
    );
  }
}
