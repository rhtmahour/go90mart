import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust based on the available width
        bool isSmallScreen = constraints.maxWidth < 600;
        double imageSize = isSmallScreen ? 60 : 80; // Adjust size dynamically

        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Text(
                'Shop By Category',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Wrap widget to avoid overflow
            SizedBox(height: 5),
            Wrap(
              spacing: 20, // Space between items
              runSpacing: 10, // Space between rows
              alignment: WrapAlignment.center,
              children: [
                _buildCategoryItem(
                    context, 'assets/images/fruits2.png', 'Fruits', imageSize),
                _buildCategoryItem(context, 'assets/images/vegetables.png',
                    'Vegetables', imageSize),
                _buildCategoryItem(
                    context, 'assets/images/meat1.png', 'Meat', imageSize),
                _buildCategoryItem(context, 'assets/images/dairy_products.png',
                    'Dairy', imageSize),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // First row of category labels
            //_buildCategoryLabelsRow(['Fruits', 'Vegetables', 'Meat', 'Dairy']),
            // Second row with new categories
            Wrap(
              spacing: 20,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _buildCategoryItem(context, 'assets/images/cold_drink1.png',
                    'Cold Drinks', imageSize),
                _buildCategoryItem(
                    context, 'assets/images/bakery.png', 'Bakery', imageSize),
                _buildCategoryItem(
                    context, 'assets/images/coffee.png', 'Coffee', imageSize),
                _buildCategoryItem(context, 'assets/images/instant-food.png',
                    'Instant Food', imageSize),
              ],
            ),
            // Second row of category labels
            //_buildCategoryLabelsRow(['Cold Drinks', 'Bakery', 'Coffee', 'Instant Food']),
          ],
        );
      },
    );
  }

  // Helper function to build category items
  Widget _buildCategoryItem(
      BuildContext context, String imagePath, String label, double size) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/third');
      },
      child: Column(
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),
              ),
              color: Colors.white,
              border: Border.all(width: 0.5, color: Colors.black),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build row of category labels
  Widget _buildCategoryLabelsRow(List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: labels.map((label) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            label,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        );
      }).toList(),
    );
  }
}
