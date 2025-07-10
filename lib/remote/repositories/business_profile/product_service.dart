import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../entities/business_profile/product_entity.dart';

class ProductService {
  final String baseUrl = 'https://mekanly.com.tm/api/v2';

  Future<ProductEntity> getProductById(int productId) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/business/category/$productId/products?offset=0&limit=1'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProductEntity.fromJson(data['data'][0] as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<List<ProductEntity>> getSimilarProducts(int categoryId) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/business/category/$categoryId/products?offset=0&limit=4'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['data'] as List)
          .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load similar products');
    }
  }
}
