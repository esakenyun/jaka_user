import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jaka_user/hooks/api_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Merchant {
  int totalRatings;
  String id;
  double lat;
  double lng;
  double ratings;
  String description;
  String address;
  String imageUrl;
  String name;

  Merchant({
    required this.totalRatings,
    required this.id,
    required this.lat,
    required this.lng,
    required this.ratings,
    required this.description,
    required this.address,
    required this.imageUrl,
    required this.name,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      totalRatings: json['total_ratings'] ?? 0,
      id: json['id'] ?? '',
      lat: json['lat']?.toDouble() ?? 0.0,
      lng: json['lng']?.toDouble() ?? 0.0,
      ratings: json['ratings']?.toDouble() ?? 0.0,
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      imageUrl: json['image_url'] ?? '',
      name: json['name'] ?? '',
    );
  }

  static Future<List<Merchant>> getAllMerchants() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userDataJson = prefs.getString('userData');

      if (userDataJson == null) {
        throw Exception('User data not found');
      }

      final Map<String, dynamic> userData = json.decode(userDataJson);
      final String? token = userData['token'];
      print(token);

      if (token == null) {
        throw Exception('Token not found');
      }

      final Dio dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';

      final Response response =
          await dio.get('${APIConstants.baseURL}merchants/ratings');

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data['data'];
        final List<Merchant> merchants =
            dataList.map((json) => Merchant.fromJson(json)).toList();
        return merchants;
      } else {
        throw Exception('Failed to load merchants');
      }
    } catch (error) {
      throw Exception('Failed to load merchants: $error');
    }
  }
}
