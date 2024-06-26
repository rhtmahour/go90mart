import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/component/onboarding_page.dart';

@immutable
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OnboardingPage(
            image: Image.asset("assets/images/all_grocery.png"),
            title: "Welcome",
            description:
                "Welcome to the best online grocery store. Here you will find all the groceries at one place.",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 0,
          ),
          OnboardingPage(
            image: Image.asset("assets/images/grocery.png"),
            title: "Fresh Fruits & Vegetables",
            description:
                "Buy farm fresh fruits & vegetables online at the best & affordable prices.",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 1,
          ),
          OnboardingPage(
            image: Image.asset("assets/images/delivery.png"),
            title: "Quick & Fast Delivery",
            description:
                "We offer speedy delivery of your groceries, baby care products, pet care items, stationary, etc within 9 to 90 minutes at your doorstep.",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 2,
          ),
        ],
      ),
    );
  }

  //Lets write function to change next onboarding screen
  void changeScreen(int nextScreenNo) {
    controller.animateToPage(nextScreenNo,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
