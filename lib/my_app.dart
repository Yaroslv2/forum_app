import 'package:flutter/material.dart';
import 'package:light_digital_test_app/routes/pages.dart';
import 'package:light_digital_test_app/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light Digital Testing Application',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const SystemSplashScreen(),
    );
  }
}