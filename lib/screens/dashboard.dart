import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/screens/home_screen.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to HomeScreen when the back button is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        return false; // Prevent default back button action
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dashboard"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ),
        body: Center(
          child: Text("Dashboard Page"),
        ),
      ),
    );
  }
}
