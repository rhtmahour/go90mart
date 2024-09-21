import 'package:flutter/material.dart';
import 'package:grocery_onboarding_app/woo_commerce_service.dart'; // Import the service class

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  WooCommerceService _service = WooCommerceService();
  Future<List<dynamic>>? _categoriesFuture;

  final String defaultImageUrl =
      'https://img.freepik.com/premium-vector/grocery-set-meat-fish-salad-bread-milk_169241-692.jpg?w=1060'; // Default image URL

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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.green],
            ),
          ),
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
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final imageUrl = defaultImageUrl; // Placeholder image for now

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4.0,
                    shadowColor: Colors.black26,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          imageUrl,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.image_not_supported,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      title: Text(
                        category['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        'Explore more',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green[400],
                      ),
                      onTap: () {
                        // Navigate to a detailed category page
                        Navigator.pushNamed(context, '/third',
                            arguments: category);
                      },
                    ),
                  ),
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
