import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
            child: const Column(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.green,
                  size: 32,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
            child: const Column(
              children: [
                Icon(
                  Icons.category,
                  color: Colors.green,
                  size: 32,
                ),
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "CartPage");
            },
            child: const Column(
              children: [
                Icon(
                  CupertinoIcons.cart,
                  color: Colors.green,
                  size: 32,
                ),
                Text(
                  "My Cart",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "myaccount");
            },
            child: const Column(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 32,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
