import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/woo_commerce_service.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  WooCommerceService _service = WooCommerceService();
  Future<List<dynamic>>? _categoriesFuture;

  final String defaultImageUrl =
      'https://img.freepik.com/premium-vector/grocery-set-meat-fish-salad-bread-milk_169241-692.jpg?w=1060'; // Default image for all categories

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _service.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.red, Colors.green])),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final categories = snapshot.data!;
            return LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = (constraints.maxWidth > 600) ? 3 : 2;

                return GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount, // Responsive columns
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.8, // Adjust for better aspect ratio
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    // Use the default image URL for now
                    final imageUrl = defaultImageUrl;

                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/third');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 6.0,
                        shadowColor: Colors.green.withOpacity(0.6),
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Ensure image is responsive and fits within the card
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                imageUrl,
                                height: 100, // Adjust height for responsiveness
                                width: double.infinity,
                                fit: BoxFit.cover, // Make image responsive
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                  Icons.image_not_supported,
                                  size: 70,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              category['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Explore more',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No categories found'));
          }
        },
      ),
    );
  }
}
