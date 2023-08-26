import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final Function() function;

  const LoginButton({
    super.key,
    required this.color,
    required this.text,
    required this.textColor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          maximumSize: const Size(double.infinity, 56),
          //minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
