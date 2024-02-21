import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({Key? key}) : super(key: key);
  //final TextEditingController _searchController = TextEditingController();
  final int pageLength = 5; // Set the total number of carousel items
  final int currentPageIndex = 0; // Set the initially selected page index
  @override
  Widget build(BuildContext context) {
    var container = Container(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage("assets/images/slider1.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
    return Column(
      children: [
        CarouselSlider(
          items: [
            // 1st Image of Slider
            Container(
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/slider2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 2nd Image of Slider
            container,
            // 3rd Image of Slider
            Container(
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/slider3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 4th Image of Slider
            Container(
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/slider4.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 5th Image of Slider
            Container(
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/slider5.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          // Slider Container properties
          options: CarouselOptions(
            height: 150.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
        //const SizedBox(height: 70.0),
        DotsIndicator(
          dotsCount:
              pageLength, // Replace with the actual number of carousel items
          position: currentPageIndex, // Initially selected page
          decorator: DotsDecorator(
            color: Colors.black87,
            activeColor: Colors.green,
            size: const Size.square(9.0),
            spacing: const EdgeInsets.all(3.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}
