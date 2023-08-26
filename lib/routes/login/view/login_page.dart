import 'package:flutter/material.dart';
import 'package:light_digital_test_app/routes/login/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginForm(),
    );
  }
}
