import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //first row of Text
        const Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              'Shop By Category',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        //Fisrt row of images
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 11, left: 10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/fruits2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 11),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/vegetables.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 11),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/meat1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 11),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/dairy_products.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        //First row text
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 25)),
            Text(
              'Fruits',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Padding(padding: EdgeInsets.only(left: 46)),
            Text(
              'Vegetables',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Padding(padding: EdgeInsets.only(right: 42)),
            Text(
              'Meat',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Padding(padding: EdgeInsets.only(right: 60)),
            Text(
              'Dairy',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        //Second Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 11, left: 10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/cold_drink1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 11),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/bakery.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 11),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/coffee.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 11),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/instant-food.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        //Text of Second row category
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              'Cold Drinks',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Padding(padding: EdgeInsets.only(left: 20)),
            Text(
              'Bakery',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Padding(padding: EdgeInsets.only(right: 50)),
            Text(
              'Coffee',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Padding(padding: EdgeInsets.only(right: 30)),
            Text(
              'Instant Food',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
