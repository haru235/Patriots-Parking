import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    // use firebase email/password ui
    return const SignInScreen(
      providerConfigs: [
        EmailProviderConfiguration(),
      ],
    );
  }
}
