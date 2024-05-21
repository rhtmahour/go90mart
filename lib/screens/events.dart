import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/screens/home_screen.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Events"),
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
      body: const Center(
        child: Text("Events Page"),
      ),
    );
  }
}
