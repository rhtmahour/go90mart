import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_onboarding_app/screens/otp.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  var phone = "";
  String verificationId = "";

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img1.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 25),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "We need to register your phone before getting started!",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          phone = value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryController.text + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        savePhoneNumberToFirestore(phone);
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        // Handle verification failed
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        setState(() {
                          this.verificationId = verificationId;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyOtp(
                              verificationId: verificationId,
                              phoneNumber: phone,
                            ),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        setState(() {
                          this.verificationId = verificationId;
                        });
                      },
                    );
                  },
                  child: const Text(
                    "Send the code",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'authpage',
                        (route) => false,
                      );
                    },
                    child: const Text(
                      "Use Email",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> savePhoneNumberToFirestore(String phoneNumber) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await firestore.collection('users').doc(user.uid).set({
        'phoneNumber': phoneNumber,
      });
    }
  }
}
