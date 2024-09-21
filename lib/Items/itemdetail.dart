import 'package:flutter/material.dart';

class Itemdetail extends StatelessWidget {
  final dynamic product;
  final String description;

  const Itemdetail({Key? key, required this.product, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen's height and width
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.4, // Responsive height for the image
                width: double.infinity,
                child: Image.network(
                  product['images'][0]['src'],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                product['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth < 600 ? 20 : 24, // Responsive text size
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Price: \Rs.${product['price']}',
                style: TextStyle(
                  fontSize: screenWidth < 600 ? 18 : 20, // Responsive text size
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 16),
              Text(
                description.isNotEmpty
                    ? description
                    : 'No description available',
                style: TextStyle(
                  fontSize: screenWidth < 600 ? 14 : 16, // Responsive text size
                ),
              ),
              SizedBox(height: 70), // Add space before the button
              Center(
                child: FloatingActionButton.extended(
                  backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
                  onPressed: () {},
                  label: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(Icons.add, color: Colors.white, size: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
