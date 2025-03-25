import 'package:dio/dio.dart';
import 'package:speedkart/core/network/api_service.dart';
import '../models/product_model.dart';
// import '../../../core/network/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository({required this.apiService});

  Future<List<Product>> fetchProducts({int limit = 10, int skip = 0}) async {
    Response response = await apiService.getProducts(limit: limit, skip: skip);
    if (response.statusCode == 200) {
      final data = response.data;
      List productsJson = data['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
