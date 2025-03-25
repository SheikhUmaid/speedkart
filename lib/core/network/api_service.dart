import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://dummyjson.com';

  Future<Response> getProducts({int limit = 10, int skip = 0}) async {
    debugPrint("----------------------API Called----------------");
    final response = await _dio.get(
      '$baseUrl/products',
      queryParameters: {'limit': limit, 'skip': skip},
    );
    debugPrint(response.toString());
    return response;
  }
}
