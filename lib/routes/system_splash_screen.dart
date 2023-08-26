import 'package:flutter/material.dart';
import 'package:light_digital_test_app/routes/login/view/login_page.dart';

class SystemSplashScreen extends StatefulWidget {
  const SystemSplashScreen({super.key});

  @override
  State<SystemSplashScreen> createState() => _SystemSplashScreenState();
}

class _SystemSplashScreenState extends State<SystemSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  _navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(
            "assets/images/logo.png",
          ),
          width: 42,
          height: 45,
        ),
      ),
    );
  }
}
