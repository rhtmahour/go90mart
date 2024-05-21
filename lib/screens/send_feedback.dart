import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/screens/home_screen.dart';

class SendFeedbackPage extends StatefulWidget {
  const SendFeedbackPage({Key? key}) : super(key: key);
  @override
  _SendFeedbackPageState createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Send feedback"),
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
        child: Text("Send Feedback Page"),
      ),
    );
  }
}
