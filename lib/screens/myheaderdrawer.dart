import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user_profile.png'),
              ),
            ),
          ),
          const Text(
            "User",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            FirebaseAuth.instance.currentUser!.email!,
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
          ),
        ],
      ),
    );
  }
}
