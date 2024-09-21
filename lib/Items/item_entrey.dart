import 'dart:convert'; // Needed for json.decode and base64Encode
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:grocery_onboarding_app/Items/itemdetail.dart';
import 'package:grocery_onboarding_app/screens/cart_provider.dart';
import 'package:grocery_onboarding_app/screens/cartpage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart'; // Import CartProvider

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<dynamic> products = [];
  int currentPage = 1; // To track the current page

  // WooCommerce API credentials
  final String consumerKey = 'ck_80f6659ac9df1f58a9b8a550a384bd36c8a36951';
  final String consumerSecret = 'cs_2d6d405f0ab2924000ae7c8bdc7160440a8a71bb';

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Fetch first page by default
  }

  // Fetching products from WooCommerce API with pagination support
  Future<void> fetchProducts() async {
    final String apiUrl =
        'https://go90mart.com/wp-json/wc/v3/products?per_page=20&page=$currentPage';

    final String credentials =
        base64Encode(utf8.encode('$consumerKey:$consumerSecret'));
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Basic $credentials'},
    );

    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      print('Failed to load products');
    }
  }

  // Method to handle pagination logic
  void _nextPage() {
    setState(() {
      currentPage++;
      fetchProducts();
    });
  }

  void _previousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
        fetchProducts();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider =
        Provider.of<CartProvider>(context); // Access CartProvider

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Products',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Center(
              child: badges.Badge(
                badgeContent: Text(
                  cartProvider.getCounter().toString(),
                  style: TextStyle(color: Colors.white),
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
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = (constraints.maxWidth < 600)
                            ? 2
                            : 4; // Responsiveness

                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Itemdetail(
                                      product: product, // Pass product data
                                      description: product[
                                          'description'], // Pass description
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        product['images'][0]['src'],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        product['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '\Rs.${product['price']}',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Spacer(flex: 5),
                                        FloatingActionButton.small(
                                          backgroundColor: Colors.green,
                                          onPressed: () {
                                            cartProvider.addItemToCart(product);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    '${product['name']} added to cart!'),
                                              ),
                                            );
                                          },
                                          child: Icon(Icons.add),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                // Pagination buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: currentPage > 1 ? _previousPage : null,
                      child: Text('Previous'),
                    ),
                    TextButton(
                      onPressed: _nextPage,
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
