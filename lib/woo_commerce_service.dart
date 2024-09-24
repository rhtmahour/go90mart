import 'dart:convert';
import 'package:http/http.dart' as http;

class WooCommerceService {
  final String consumerKey = 'ck_80f6659ac9df1f58a9b8a550a384bd36c8a36951';
  final String consumerSecret = 'cs_2d6d405f0ab2924000ae7c8bdc7160440a8a71bb';
  final String baseUrl = 'https://go90mart.com/wp-json/wc/v3';

  Future<List<dynamic>> fetchCategories() async {
    final String credentials = '$consumerKey:$consumerSecret';
    final String encodedCredentials = base64Encode(utf8.encode(credentials));

    final response = await http.get(
      Uri.parse('$baseUrl/products/categories?per_page=100'),
      headers: {
        'Authorization': 'Basic $encodedCredentials',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<dynamic>> fetchProductsByCategory(int categoryId) async {
    final String credentials = '$consumerKey:$consumerSecret';
    final String encodedCredentials = base64Encode(utf8.encode(credentials));

    final response = await http.get(
      Uri.parse('$baseUrl/products?category=$categoryId'),
      headers: {
        'Authorization': 'Basic $encodedCredentials',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
