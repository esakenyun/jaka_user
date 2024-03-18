import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jaka_user/hooks/api_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login {
  String email;
  String password;
  String type;

  Login({
    required this.email,
    required this.password,
    required this.type,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        email: json["email"],
        password: json["password"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "type": type,
      };

  Future<void> saveUser(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', json.encode(userData));
  }

  Future<Map<String, dynamic>?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      Map<String, dynamic> userData = json.decode(userDataJson);
      return userData;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> signIn() async {
    try {
      final Dio dio = Dio();
      final Response response =
          await dio.post('${APIConstants.baseURL}auth/login', data: {
        'email': email,
        'password': password,
        'type': type,
      });

      if (response.statusCode == 200) {
        final responseData = response.data['data'];
        final token = responseData['token'];
        final user = responseData['user'];

        await saveUser({'token': token, 'user': user});
        return {'token': token, 'user': user};
      } else {
        return {};
      }
    } catch (error) {
      return {};
    }
  }
}
