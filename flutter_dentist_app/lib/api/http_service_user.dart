import 'dart:convert';

import 'package:flutter_dentist_app/model/User.dart';
import 'package:http/http.dart';

class HttpServiceUser {
  final String url = "http://10.0.2.2:3000/api/v1/users";
  Future<User> login(String username, String password) async {
    Map data = {'name': username, 'password': password};
    Response res = await post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    Map<String, dynamic> result = jsonDecode(res.body);
    if (res.statusCode == 200) {
      dynamic body = result["data"];
      User user = User.fromJson(body);
      return user;
    }
    throw 'Login Failed';
  }

  Future<User> register(
      String username, String password, String name, String address) async {
    Map data = {
      'username': username,
      'password': password,
      'role': 'customer',
      'name': name,
      'avatar': 'assets/images/user/user1.jpg',
      'address': address,
      'isActive': true,
    };
    Response res = await post(
      Uri.parse("http://10.0.2.2:3000/api/v1/users/register"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    Map<String, dynamic> result = jsonDecode(res.body);
    if (res.statusCode == 201) {
      dynamic body = result["data"];
      User user = User.fromJson(body);
      return user;
    }
    throw result['message'];
  }
}
