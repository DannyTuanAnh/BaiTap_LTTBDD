import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ApiService {
  static const String baseUrl =
      'https://mock.apidog.com/m1/890655-872447-default/v2';

  // Fetch product from API
  Future<Product> fetchProduct() async {
    try {
      final url = Uri.parse('$baseUrl/product');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return Product.fromJson(jsonData);
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }
}
