import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
import 'package:grocery_onboarding_app/screens/mydrawer.dart';
import 'package:grocery_onboarding_app/screens/orderpage.dart';
import 'package:grocery_onboarding_app/screens/otp.dart';
import 'package:grocery_onboarding_app/screens/phone.dart';
import 'package:grocery_onboarding_app/screens/product.dart';
import 'package:grocery_onboarding_app/screens/slider_screen.dart';
import 'package:grocery_onboarding_app/screens/category.dart';
import 'package:grocery_onboarding_app/screens/homebottombar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const CategoriesPage(),
        //when navigating to the "/third" route, build the thirdscreen widget.
        '/third': (context) => const ItemPage(),
        //when navigating to the "CartPage" route, build the fourth screen
        'CartPage': (context) => const CartPage(),
        //when navigating to the "ItemDetailPage" route, build the item_detail
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
        //when navigating to the "OrderPage" route, build the orderpage
        'orderPage': (context) => const OrderPage(),
        //When navigating to the "MyAccountPage" route to the LoginPage
        'myaccount': (context) => const MyAccountPage(),
        'phone': (context) => const MyPhone(),
        'otp': (context) => MyOtp(),
        //'emaillogin': (context) => const EmailLogin({super.key, required this.onPressed}),
        'authpage': (context) => const AuthPage(),
        //'signuppage':(context) => const SignupPage({super.key, required this.onPressed}),
      },
      debugShowCheckedModeBanner: false,
      home: MyDrawerHome(),
    );
  }
}

class MyDrawerHome extends StatelessWidget {
  MyDrawerHome({super.key});
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.login),
          )
        ],*/
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
      body: Center(child: Builder(builder: (context) {
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
              //const SizedBox(height: 70.0),
              const Category(),
              //const SizedBox(height: 50.0),
              const ProductPage(),
              //const SizedBox(height: 100.0),
              const BrandPage(),
            ],
          ),
        );
      })),
      bottomNavigationBar: const HomeBottomBar(),
      drawer: const MyDrawer(),
    );
  }
}
