import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/Items/dairymilkdetail.dart';
import 'package:grocery_onboarding_app/Items/gluconddetail.dart';
import 'package:grocery_onboarding_app/Items/laysdetail.dart';
import 'package:grocery_onboarding_app/Items/odonildetail.dart';
import 'package:grocery_onboarding_app/Items/pepsidetail.dart';
import 'package:grocery_onboarding_app/Items/redlabeldetail.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(left: 10)),
            const Text(
              'Featured Products',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.only(right: 160)),
            InkWell(
              onTap: () {
                //Navigator.pushNamed(context, 'dairymilk');
              },
              child: Container(
                height: 22,
                width: 22,
                //color: Colors.grey[200],
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.grey[200]),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => dairymilk()));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 11),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(21),
                                bottomRight: Radius.circular(21)),
                            color: Colors.white,
                            border: Border.all(width: 0.5, color: Colors.black),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/dairymilk.png"),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Dairy Milk',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => lays()));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 11),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(21),
                                bottomRight: Radius.circular(21)),
                            color: Colors.white,
                            border: Border.all(width: 0.5, color: Colors.black),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/11.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Lays',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => pepsi()));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 11),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(21),
                                bottomRight: Radius.circular(21)),
                            color: Colors.white,
                            border: Border.all(width: 0.5, color: Colors.black),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/pepsi.webp"),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'pepsi',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => odonil()));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 11),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(21),
                                bottomRight: Radius.circular(21)),
                            color: const Color.fromARGB(255, 79, 49, 49),
                            border: Border.all(width: 0.5, color: Colors.black),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/odonil.webp"),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Odonil',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => glucond()));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 11),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(21),
                                bottomRight: Radius.circular(21)),
                            color: Colors.white,
                            border: Border.all(width: 0.5, color: Colors.black),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/glucond2.jpg"),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Glucon-D',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => redlabel()));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 11),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(21),
                                bottomRight: Radius.circular(21)),
                            color: Colors.white,
                            border: Border.all(width: 0.5, color: Colors.black),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/redlabel.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Red Label',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/third');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 11),
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(21),
                              bottomRight: Radius.circular(21)),
                          color: Colors.white,
                          border: Border.all(width: 0.5, color: Colors.black),
                        ),
                        child: const Center(
                            child: Text(
                          'View all',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    const Text(
                      '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
