import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_onboarding_app/Items/item_entrey.dart';
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
import 'package:grocery_onboarding_app/screens/productsearchpage.dart';
import 'package:grocery_onboarding_app/screens/send_feedback.dart';
import 'package:grocery_onboarding_app/screens/settings.dart';
import 'package:grocery_onboarding_app/screens/slider1.dart';
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
        '/second': (context) => CategoriesPage(),
        '/third': (context) => ItemPage(),
        'CartPage': (context) => CartPage(),
        'orderPage': (context) => const OrderPage(),
        'myaccount': (context) => const MyAccountPage(),
        'phone': (context) => const MyPhone(),
        'otp': (context) => MyOtp(
              verificationId: '',
              phoneNumber: '',
            ),
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
  User? user;
  File? pickedImageFile;
  final TextEditingController _searchController = TextEditingController();
  String? name;
  String? phoneNumber;
  String? email;
  bool _isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _isLoggedIn = user != null;
    if (_isLoggedIn) {
      // Fetch user data from Firestore or another source
      name = user?.displayName;
      phoneNumber = user?.phoneNumber;
    }
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
                          if (user != null && user!.email != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserProfileEditPage(email: user!.email!),
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
                      _isLoggedIn && name != null && name!.isNotEmpty
                          ? name!
                          : 'No name available',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      _isLoggedIn &&
                              phoneNumber != null &&
                              phoneNumber!.isNotEmpty
                          ? phoneNumber!
                          : 'No phone number available',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    if (_isLoggedIn && user != null && user!.email != null)
                      Text(
                        user!.email!,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15),
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
            if (_isLoggedIn)
              PrettyFuzzyButton(
                text: 'Logout',
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  setState(() {
                    _isLoggedIn = false;
                  });
                },
              )
            else
              PrettyFuzzyButton(
                text: 'Login',
                onPressed: () async {
                  // Handle login logic here
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyAccountPage()));
                  setState(() {
                    _isLoggedIn = true;
                  });
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
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            filled:
                                true, // Adds background color to the search bar
                            fillColor: Colors
                                .grey[200], // Set a light background color
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20), // Add some padding
                            labelText: 'Search for products...',
                            labelStyle: TextStyle(
                                color: Colors
                                    .grey[700]), // Customize label text color
                            hintText: 'Find the best deals...',
                            hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14), // Set hint text style
                            prefixIcon: Icon(Icons.search,
                                color: Colors
                                    .green), // Customize the search icon color
                            suffixIcon: IconButton(
                              icon: Icon(Icons.close,
                                  color: Colors
                                      .red), // Add a clear (close) button to reset search
                              onPressed: () {
                                _searchController
                                    .clear(); // Clear the search text
                                FocusScope.of(context)
                                    .unfocus(); // Dismiss the keyboard
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Add rounded corners
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2), // Border color when not focused
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded corners
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2), // Border color when focused
                            ),
                          ),
                          onSubmitted: (searchQuery) {
                            searchQuery = _searchController.text.trim();
                            if (searchQuery.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductSearchPage(
                                      searchQuery: searchQuery),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const Slider1(),
                  const Category(),
                  const SliderPage(),
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
    MediaQuery.of(context);
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
