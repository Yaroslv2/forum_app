import 'package:flutter/material.dart';
import 'package:light_digital_test_app/routes/profile/view/profile_form.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 83,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "мой профиль",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: ProfileForm(),
    );
  }
}
