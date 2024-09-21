import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/screens/cart_model.dart';
import 'package:grocery_onboarding_app/screens/cart_provider.dart';
import 'package:grocery_onboarding_app/screens/db_helper.dart';
import 'package:provider/provider.dart';

class ItemBottomBar extends StatefulWidget {
  final String productName;
  final String productUnit;
  final int productPrice; // Assuming productPrice is of type int
  final String productImage;
  final String productDescription;
  final int index;

  const ItemBottomBar({
    super.key,
    required this.productName,
    required this.productUnit,
    required this.productPrice,
    required this.productImage,
    required this.productDescription,
    required this.index,
  });

  @override
  State<ItemBottomBar> createState() => _ItemBottomBarState();
}

class _ItemBottomBarState extends State<ItemBottomBar> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          dbHelper!
              .insert(Cart(
            id: widget.index,
            productId: widget.index.toString(),
            productName: widget.productName,
            initialPrice: widget.productPrice,
            productPrice: widget.productPrice,
            quantity: 1,
            unitTag: widget.productUnit,
            image: widget.productImage,
          ))
              .then((value) {
            print('Product is added to cart');
            // Assuming 'cart' is a provider or some state management instance
            //cart.addTotalPrice(widget.productPrice.toDouble());
            //cart.addCounter();
          }).onError((error, stackTrace) {
            print(error.toString());
          });
        },
        child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              SizedBox(width: 5),
              const Text(
                "Cart",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
