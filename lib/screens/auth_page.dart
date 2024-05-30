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
            // Show a loading indicator while checking the authentication state
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              // User is logged in, display a message and navigate to HomeScreen
              Future.delayed(Duration(seconds: 2), () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              });
              return Scaffold(
                body: Center(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                    child: Text(
                      'User is already logged in.\nRedirecting to HomeScreen...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              // User is not logged in, navigate to the login page
              return const LoginSignup();
            }
          }
        },
      ),
    );
  }
}
