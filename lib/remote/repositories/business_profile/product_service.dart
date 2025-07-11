// product_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../in_memory_token.dart';
import 'product_model.dart'; // Product, ApiResponse vb. burada tanımlı olmalı

class ProductService {
  final String baseUrl = 'https://mekanly.com.tm/api/v2/business';

  Future<ApiResponse> fetchProductsByCategory(
    int categoryId, {
    int offset = 0,
    int limit = 10,
  }) async {
    final url = Uri.parse(
        '$baseUrl/category/$categoryId/products?offset=$offset&limit=$limit');

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${InMemoryToken.instance.token}',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      return ApiResponse.fromJson(jsonBody);
    } else {
      throw Exception('Ürünler yüklenemedi: ${response.statusCode}');
    }
  }
}
