import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_onboarding_app/screens/home_screen.dart';
import 'package:grocery_onboarding_app/screens/phoneusereditpage.dart'; // Ensure this import is correct
import 'package:pinput/pinput.dart';

class MyOtp extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const MyOtp(
      {Key? key, required this.verificationId, required this.phoneNumber})
      : super(key: key);

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
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
              Pinput(
                controller: otpController,
                length: 6,
                showCursor: true,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
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
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otpController.text,
                      );
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithCredential(credential);
                      savePhoneNumberToFirestore(widget.phoneNumber);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneUserEditProfile(
                                phoneNumber: widget
                                    .phoneNumber)), // Corrected class name
                      );
                    } catch (e) {
                      // Handle errors here
                    }
                  },
                  child: const Text(
                    "Verify Phone Number",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
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
                      "Edit Phone Number?",
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
