import 'package:flutter/material.dart';
import 'package:light_digital_test_app/routes/home/home.dart';
import 'package:light_digital_test_app/routes/login/login.dart';
import 'package:light_digital_test_app/routes/navigation_bottom_bar.dart';
import 'package:light_digital_test_app/routes/onboarding/onboarding_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        children: [
          const Expanded(
            flex: 10,
            child: Center(
              child: Image(
                image: AssetImage(
                  "assets/images/logo.png",
                ),
                width: 42,
                height: 45,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: LoginButton(
              color: const Color(0xFFC60033),
              text: "Войти через ЕЛК",
              textColor: Colors.white,
              function: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          Flexible(
            flex: 1,
            child: LoginButton(
              color: Color(0xFFFDF0F4),
              text: "Войти без регистрации",
              textColor: Color(0xFFC60033),
              function: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationBottomBar(),
                  ),
                );
                showModalBottomSheet(
                  useSafeArea: true,
                  elevation: 0,
                  isScrollControlled: true,
                  enableDrag: false,
                  context: context,
                  builder: (context) => OnboardingPage(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
