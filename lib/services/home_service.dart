import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/product_model.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await _dio.get('https://api.escuelajs.co/api/v1/products');
      List<dynamic> data = response.data;
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}