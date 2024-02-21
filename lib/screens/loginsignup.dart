import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/screens/emaillogin.dart';
import 'package:grocery_onboarding_app/screens/signuppage.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  bool islogin = true;

  void togglePage() {
    setState(() {
      islogin = !islogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (islogin) {
      return EmailLogin(
        onPressed: togglePage,
      );
    } else {
      return SignupPage(
        onPressed: togglePage,
      );
    }
  }
}
