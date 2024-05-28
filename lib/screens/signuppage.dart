import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final void Function()? onPressed;
  const SignupPage({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      // Save user data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': _name.text,
        'phoneNumber': _phonenumber.text,
        'email': _email.text,
      });

      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The password provided is too weak"),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The account already exists for that email."),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.red, Colors.green])),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/img1.png',
                      width: 150,
                      height: 150,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  TextFormField(
                    controller: _name,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Name is not Empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextFormField(
                    controller: _phonenumber,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Phone Number is not Empty';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(labelText: "Phone Number"),
                  ),
                  TextFormField(
                    controller: _email,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Email is empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextFormField(
                    controller: _password,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Password is empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          createUserWithEmailAndPassword();
                        }
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: widget.onPressed,
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
