import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

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
            const Padding(padding: EdgeInsets.only(right: 200)),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/third');
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
                    Container(
                        margin: const EdgeInsets.only(right: 11),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(21),
                              bottomRight: Radius.circular(21)),
                          color: Colors.white,
                          border: Border.all(width: 0.5, color: Colors.black),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/capsicum.png"),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Text(
                      'Capsicum',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 11),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(21),
                              bottomRight: Radius.circular(21)),
                          color: Colors.white,
                          border: Border.all(width: 0.5, color: Colors.black),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/cflower.png"),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Text(
                      'Cauliflower',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 11),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(21),
                              bottomRight: Radius.circular(21)),
                          color: Colors.white,
                          border: Border.all(width: 0.5, color: Colors.black),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/onion.png"),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Text(
                      'Onion',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 11),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(21),
                              bottomRight: Radius.circular(21)),
                          color: Colors.white,
                          border: Border.all(width: 0.5, color: Colors.black),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/potato.png"),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Text(
                      'Potato',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 11),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(21),
                              bottomRight: Radius.circular(21)),
                          color: Colors.white,
                          border: Border.all(width: 0.5, color: Colors.black),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/tomato.png"),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Text(
                      'Tomato',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 11),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(21),
                              bottomRight: Radius.circular(21)),
                          color: Colors.white,
                          border: Border.all(width: 0.5, color: Colors.black),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/ginger.png"),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Text(
                      'Ginger',
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
                        print("Clicked View all Container");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 11),
                        height: 100,
                        width: 100,
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
