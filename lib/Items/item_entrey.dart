import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:grocery_onboarding_app/screens/cart_model.dart';
import 'package:grocery_onboarding_app/screens/cart_provider.dart';
import 'package:grocery_onboarding_app/screens/cartpage.dart';
import 'package:grocery_onboarding_app/screens/db_helper.dart';
import 'package:grocery_onboarding_app/screens/productdetailpage.dart';
import 'package:provider/provider.dart';
// Import the new detail page

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

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
  List<String> productDescription = [
    'BURSTING FLAVOUR: The Lay’s India’s Magic Masala spice blend will excite your tastebuds;QUALITY POTATOES',
    'This rich shampoo is a blend of pure soya bean protein, berberry and wild tumeric extracts to cleanse hair without disturbing its natural pH balance. Prevents color fade',
    'Bonns latest addition to their hugely popular range of 100% Eggless cakes, Sweet Desire Assorted Packs',
    'Cadbury OREO crème biscuits are made with cocoa, which defines their unique chocolatey flavour',
    'Ariel Matic liquid detergent removes tough stains in just 1 wash and protects your colored clothes from fading',
    'Our gulkand is prepared from high quality pink colored Indian Rose Petals prepared by traditional Ayurvedic method',
    'Baygon Max Mosquito and Fly Killer spray is an easy way to ensure your home is free from mosquito-borne diseases like Dengue and Malaria',
    'Colgate Visible White starts whitening your teeth in 1 week and offers you a real white smile when used as directed',
    'The taste of Brooke Bond Red Label tea helps you spread warmth and cheer in your family.',
    'Odonil Room Spray is formulated with a special fragrance that provides long-lasting freshness and a pleasant rose scent to your home or office space',
  ];

  List<int> quantities = List<int>.generate(10, (int index) => 0);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Store',
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
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      productName: productName[index],
                      productUnit: productUnit[index],
                      productPrice: productPrice[index],
                      productImage: productImage[index],
                      productDescription: productDescription[index],
                    ),
                  ),
                );
              },
              child: Card(
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
                                  onTap: () {
                                    setState(() {
                                      if (quantities[index] > 0) {
                                        quantities[index]--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    quantities[index].toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantities[index]++;
                                      if (quantities[index] > 0) {
                                        dbHelper!
                                            .insert(Cart(
                                          id: index,
                                          productId: index.toString(),
                                          productName: productName[index],
                                          initialPrice: productPrice[index],
                                          productPrice: productPrice[index] *
                                              quantities[index],
                                          quantity: quantities[index],
                                          unitTag: productUnit[index],
                                          image: productImage[index],
                                        ))
                                            .then((value) {
                                          print('Product is added to cart');
                                          cart.addTotalPrice(double.parse(
                                                  productPrice[index]
                                                      .toString()) *
                                              quantities[index]);
                                          cart.addCounter();
                                        }).onError((error, stackTrace) {
                                          print(error.toString());
                                        });
                                      } else {
                                        print(
                                            'Quantity should be greater than 0');
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
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
                            productName: productName[index].toString(),
                            initialPrice: productPrice[index],
                            productPrice: productPrice[index],
                            quantity: 1,
                            unitTag: productUnit[index].toString(),
                            image: productImage[index].toString(),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.shopping_cart, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
