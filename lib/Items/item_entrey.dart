//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
//import 'package:flutter/widgets.dart';
import 'package:grocery_onboarding_app/screens/cart_model.dart';
import 'package:grocery_onboarding_app/screens/cart_provider.dart';
import 'package:grocery_onboarding_app/screens/cartpage.dart';
import 'package:grocery_onboarding_app/screens/db_helper.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({
    super.key,
  });

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  DBHelper? dbHelper = DBHelper();

  List<String> productName = [
    'LAYS',
    'BIOTIQUE',
    'BONN Cake',
    'OREO',
    'ARIEL MATIC',
    'BAIDYANATH',
    'BAYGON',
    'COLGATE',
    'RED',
    'ODONIL'
  ];
  List<String> productUnit = [
    'GM',
    'ML',
    'GM',
    'GM',
    'Ltr',
    'GM',
    'ML',
    'GM',
    'MG',
    'ML'
  ];
  List<int> productPrice = [50, 299, 20, 70, 550, 112, 70, 195, 280, 250];
  List<String> productImage = [
    'assets/images/11.jpeg',
    'assets/images/12.jpeg',
    'assets/images/13.jpeg',
    'assets/images/14.jpeg',
    'assets/images/15.jpeg',
    'assets/images/16.jpeg',
    'assets/images/17.jpeg',
    'assets/images/18.jpeg',
    'assets/images/Redlabel.png',
    'assets/images/odonil.webp',
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Center(
              child: badges.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.getCounter().toString(),
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 20)
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.red, Colors.green])),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productName.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      productImage[index],
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName[index],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${productUnit[index]} Rs ${productPrice[index]}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              print("remove in the cart");
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            )),
                                        Text("0",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        InkWell(
                                            onTap: () {
                                              dbHelper!
                                                  .insert(Cart(
                                                id: index,
                                                productId: index.toString(),
                                                productName: productName[index],
                                                initialPrice:
                                                    productPrice[index],
                                                productPrice:
                                                    productPrice[index],
                                                quantity: 1,
                                                unitTag: productUnit[index],
                                                image: productImage[index],
                                              ))
                                                  .then((value) {
                                                print(
                                                    'Product is added to cart');
                                                cart.addTotalPrice(double.parse(
                                                    productPrice[index]
                                                        .toString()));
                                                cart.addCounter();
                                              }).onError((error, stackTrace) {
                                                print(error.toString());
                                              });
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        dbHelper!
                            .insert(Cart(
                          id: index,
                          productId: index.toString(),
                          productName: productName[index],
                          initialPrice: productPrice[index],
                          productPrice: productPrice[index],
                          quantity: 1,
                          unitTag: productUnit[index],
                          image: productImage[index],
                        ))
                            .then((value) {
                          print('Product is added to cart');
                          cart.addTotalPrice(
                              double.parse(productPrice[index].toString()));
                          cart.addCounter();
                        }).onError((error, stackTrace) {
                          print(error.toString());
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
