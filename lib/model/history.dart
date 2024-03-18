import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jaka_user/model/merchant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jaka_user/hooks/api_hooks.dart';

class HistoryOrder {
  String id;
  String address;
  int total;
  String status;
  dynamic notes;
  DateTime createdAt;
  dynamic penjamus;
  Users users;
  List<DetailOrder> detailOrders;

  HistoryOrder({
    required this.id,
    required this.address,
    required this.total,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.penjamus,
    required this.users,
    required this.detailOrders,
  });

  factory HistoryOrder.fromJson(Map<String, dynamic> json) {
    DateTime createdAt = DateTime.parse(json['created_at']);

    Users users = Users.fromJson(json['users']);

    List<DetailOrder> detailOrders = [];
    if (json['detail_orders'] != null) {
      var detailOrdersJson = json['detail_orders'] as List;
      detailOrders = detailOrdersJson
          .map((detailOrderJson) => DetailOrder.fromJson(detailOrderJson))
          .toList();
    }

    return HistoryOrder(
      id: json['id'] ?? '',
      address: json['address'] ?? '',
      total: json['total'] ?? 0,
      status: json['status'] ?? '',
      notes: json['notes'] ?? '',
      createdAt: createdAt,
      penjamus: json['penjamus'] ?? '',
      users: users,
      detailOrders: detailOrders,
    );
  }

  static Future<List<HistoryOrder>> getAllHistory() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userDataJson = prefs.getString('userData');

      if (userDataJson == null) {
        throw Exception('User data not found');
      }

      final Map<String, dynamic> userData = json.decode(userDataJson);
      final String? token = userData['token'];
      final String userId = userData['user']['id'];

      if (token == null) {
        throw Exception('Token not found');
      }

      final Dio dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';

      final Response response =
          await dio.get('${APIConstants.baseURL}orders?type=user&id=$userId');

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data['data'];
        print(dataList);
        final List<HistoryOrder> historyOrders =
            dataList.map((json) => HistoryOrder.fromJson(json)).toList();

        return historyOrders;
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (error) {
      throw Exception('Failed to load orders: $error');
    }
  }
}

class DetailOrder {
  int price;
  Products products;
  int quantity;

  DetailOrder({
    required this.price,
    required this.products,
    required this.quantity,
  });

  factory DetailOrder.fromJson(Map<String, dynamic> json) {
    return DetailOrder(
      price: json['price'] ?? 0,
      products: Products.fromJson(json['products']),
      quantity: json['quantity'] ?? 0,
    );
  }
}

class Products {
  String id;
  String name;
  String image;
  Merchant merchants;

  Products({
    required this.id,
    required this.name,
    required this.image,
    required this.merchants,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      merchants: Merchant.fromJson(json['merchants']),
    );
  }
}

class Users {
  String id;
  String name;

  Users({
    required this.id,
    required this.name,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class Merchants {
  String id;
  String name;

  Merchants({
    required this.id,
    required this.name,
  });

  factory Merchants.fromJson(Map<String, dynamic> json) {
    return Merchants(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}


// class HistoryOrders {
//   static Future<List<dynamic>> getAllHistory() async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       final String? userDataJson = prefs.getString('userData');

//       if (userDataJson == null) {
//         throw Exception('User data not found');
//       }

//       final Map<String, dynamic> userData = json.decode(userDataJson);
//       final String? token = userData['token'];
//       final String userId = userData['user']['id'];

//       if (token == null) {
//         throw Exception('Token not found');
//       }

//       final Dio dio = Dio();
//       dio.options.headers['Authorization'] = 'Bearer $token';

//       final Response response =
//           await dio.get('${APIConstants.baseURL}orders?type=user&id=$userId');

//       if (response.statusCode == 200) {
//         final List<dynamic> dataList = response.data['data'];
//         print(dataList);
//         return dataList;
//       } else {
//         throw Exception('Failed to load orders');
//       }
//     } catch (error) {
//       throw Exception('Failed to load orders: $error');
//     }
//   }
// }
