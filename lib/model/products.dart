import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jaka_user/hooks/api_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product {
  String id;
  String merchantId;
  String name;
  int price;
  String description;
  String image;
  DateTime createdAt;

  Product({
    required this.id,
    required this.merchantId,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    DateTime createdAt = DateTime.parse(json['created_at']);
    return Product(
      id: json['id'] ?? '',
      merchantId: json['merchant_id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      createdAt: createdAt,
    );
  }

  static Future<List<Product>> getAllProduct() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userDataJson = prefs.getString('userData');

      if (userDataJson == null) {
        throw Exception('User data not found');
      }

      final Map<String, dynamic> userData = json.decode(userDataJson);
      final String? token = userData['token'];

      if (token == null) {
        throw Exception('Token not found');
      }

      final Dio dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';

      final Response response =
          await dio.get('${APIConstants.baseURL}products');

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data['data'];
        final List<Product> products =
            dataList.map((json) => Product.fromJson(json)).toList();
        return products;
      } else {
        throw Exception('Failed to load product');
      }
    } catch (error) {
      throw Exception('Failed to load products: $error');
    }
  }
}
