import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/screens/home_screen.dart';
import 'package:grocery_onboarding_app/screens/loginsignup.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //show a loading indicator while checking the authentication state
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              //User is logged in, navigate to the home page
              return HomeScreen();
            } else {
              //User is not logged in, navigate to the loginPage
              return const LoginSignup();
            }
          }
        },
      ),
    );
  }
}
