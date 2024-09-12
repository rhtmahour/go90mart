import 'dart:convert';
import 'package:http/http.dart' as http;

class WooCommerceService {
  final String consumerKey = 'ck_80f6659ac9df1f58a9b8a550a384bd36c8a36951';
  final String consumerSecret = 'cs_2d6d405f0ab2924000ae7c8bdc7160440a8a71bb';
  final String baseUrl =
      'https://go90mart.com/wp-json/wc/v3/products/categories';

  Future<List<dynamic>> fetchCategories() async {
    final String credentials = '$consumerKey:$consumerSecret';
    final String encodedCredentials = base64Encode(utf8.encode(credentials));

    final response = await http.get(
      Uri.parse('$baseUrl?per_page=100'),
      headers: {
        'Authorization': 'Basic $encodedCredentials',
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> categories = json.decode(response.body);
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
