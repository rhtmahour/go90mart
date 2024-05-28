import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/widgets.dart';
import 'package:grocery_onboarding_app/Items/arielmaticdetail.dart';
import 'package:grocery_onboarding_app/Items/baidyanathgulkanddetail.dart';
import 'package:grocery_onboarding_app/Items/baygonmaxdetail.dart';
import 'package:grocery_onboarding_app/Items/biotiqueshampoodetail.dart';
import 'package:grocery_onboarding_app/Items/bonncakepage.dart';
import 'package:grocery_onboarding_app/Items/colgatevisible.dart';
import 'package:grocery_onboarding_app/Items/dairymilkdetail.dart';
import 'package:grocery_onboarding_app/Items/gluconddetail.dart';
import 'package:grocery_onboarding_app/Items/item_entrey.dart';
import 'package:grocery_onboarding_app/Items/laysblue.dart';
import 'package:grocery_onboarding_app/Items/laysdetail.dart';
import 'package:grocery_onboarding_app/Items/odonildetail.dart';
import 'package:grocery_onboarding_app/Items/oreocookiedetail.dart';
import 'package:grocery_onboarding_app/Items/pepsidetail.dart';
import 'package:grocery_onboarding_app/Items/redlabeldetail.dart';
import 'package:grocery_onboarding_app/screens/Categories.dart';
import 'package:grocery_onboarding_app/screens/MyAccountPage.dart';
import 'package:grocery_onboarding_app/screens/auth_page.dart';
import 'package:grocery_onboarding_app/screens/brands.dart';
import 'package:grocery_onboarding_app/screens/cartpage.dart';
import 'package:grocery_onboarding_app/screens/contacts.dart';
import 'package:grocery_onboarding_app/screens/dashboard.dart';
import 'package:grocery_onboarding_app/screens/events.dart';
import 'package:grocery_onboarding_app/screens/notes.dart';
import 'package:grocery_onboarding_app/screens/notifications.dart';
import 'package:grocery_onboarding_app/screens/orderpage.dart';
import 'package:grocery_onboarding_app/screens/otp.dart';
import 'package:grocery_onboarding_app/screens/phone.dart';
import 'package:grocery_onboarding_app/screens/privacy_policy.dart';
import 'package:grocery_onboarding_app/screens/product.dart';
import 'package:grocery_onboarding_app/screens/send_feedback.dart';
import 'package:grocery_onboarding_app/screens/settings.dart';
import 'package:grocery_onboarding_app/screens/slider_screen.dart';
import 'package:grocery_onboarding_app/screens/category.dart';
import 'package:grocery_onboarding_app/screens/homebottombar.dart';
import 'package:grocery_onboarding_app/screens/userprofileeditpage.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/home': (context) => HomeScreen(),
        '/second': (context) => const CategoriesPage(),
        '/third': (context) => ItemPage(),
        'CartPage': (context) => const CartPage(),
        'laysblue': (context) => const laysbluePage(),
        'dairymilk': (context) => const dairymilk(),
        'lays': (context) => const lays(),
        'pepsi': (context) => const pepsi(),
        'odonil': (context) => const odonil(),
        'glucond': (context) => const glucond(),
        'redlabel': (context) => const redlabel(),
        'bitotiqueshapoo': (context) => biotiqueshapoo(),
        'bonncake': (context) => bonncakepage(),
        'oreocookie': (context) => oreocookiepage(),
        'arielmatic': (context) => arielmaticpage(),
        'baidyanathgulkand': (context) => baidyanathgulkandpage(),
        'baygonmax': (context) => baygonmaxpage(),
        'colgatevisible': (context) => colgatevisiblepage(),
        'orderPage': (context) => const OrderPage(),
        'myaccount': (context) => const MyAccountPage(),
        'phone': (context) => const MyPhone(),
        'otp': (context) => MyOtp(),
        'authpage': (context) => const AuthPage(),
      },
      debugShowCheckedModeBanner: false,
      home: MyDrawerHome(),
    );
  }
}

class MyDrawerHome extends StatefulWidget {
  MyDrawerHome({super.key});

  @override
  _MyDrawerHomeState createState() => _MyDrawerHomeState();
}

class _MyDrawerHomeState extends State<MyDrawerHome> {
  File? pickedImageFile;
  final TextEditingController _searchController = TextEditingController();
  String? name;
  String? phoneNumber;
  String? email;
  //String userName = 'Admin';
  //String userPhoneNumber = '+919891477225';

  @override
  void initState() {
    super.initState();
    fetchUserData();
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

  Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      email = user.email;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          name = userDoc['name'];
          phoneNumber = userDoc['phoneNumber'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Go90",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.red, Colors.green])),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 350,
              width: double.maxFinite,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 200, bottom: 30),
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          if (user != null && user.email != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserProfileEditPage(email: user.email!),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: pickImage,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: pickedImageFile != null
                            ? FileImage(pickedImageFile!)
                            : null,
                        child: pickedImageFile == null
                            ? Icon(Icons.camera_alt,
                                size: 40, color: Colors.grey[600])
                            : null,
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                    Text(
                      name != null && name!.isNotEmpty
                          ? name!
                          : 'No name available',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    if (user != null && user.email != null)
                      Text(
                        user.email!,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15),
                      ),
                    Text(
                      phoneNumber != null && phoneNumber!.isNotEmpty
                          ? phoneNumber!
                          : 'No phone number available',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: const Text(
                'Orders',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: const Text(
                'Addresses',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactsPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.star_border),
              title: const Text(
                'Ratings and Reviews',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const EventsPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.support_agent),
              title: const Text(
                'Support',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NotesPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notification_add),
              title: const Text(
                'Notifications',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsPage()),
                );
              },
            ),
            Divider(),
            ListTile(
                title: Text(
              "FAQ's",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
            ListTile(
              title: const Text(
                'Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Send feedback',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SendFeedbackPage()),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            PrettyFuzzyButton(
              text: 'Logout',
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed('/emaillogin');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search more than 10000+ products..',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => _searchController.clear(),
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // Perform the search here
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliderPage(),
                  const Category(),
                  const ProductPage(),
                  const BrandPage(),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}

class PrettyFuzzyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrettyFuzzyButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 28.0),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
