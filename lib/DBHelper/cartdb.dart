import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart ' as http;
import 'package:th_flutter/DBHelper/userdb.dart';

import '../Model/cart.dart';

class CartDB {
  static const String _url = 'http://10.0.2.2:3000/api/user/order';

  static Future<Response> checkOut() async {
    Cart cart = Cart();
    return await http.post(
        headers: {"content-type": "application/json"},
        Uri.parse('$_url/${UserDB.currentUser!.id}'),
        body: jsonEncode(cart.toMap()));
  }
}
