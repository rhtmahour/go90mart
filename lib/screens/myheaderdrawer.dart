import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  File? pickedImageFile;
  @override
  void initState() {
    super.initState();
  }

  Future<void> pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;

      setState(() {
        pickedImageFile = File(pickedImage.path);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: pickImage,
            child: CircleAvatar(
              radius: 35,
              backgroundImage:
                  pickedImageFile != null ? FileImage(pickedImageFile!) : null,
              child: pickedImageFile == null
                  ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[600])
                  : null,
              backgroundColor: Colors.grey[200],
            ),
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
