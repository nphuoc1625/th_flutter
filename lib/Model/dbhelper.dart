import 'dart:convert';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart%20';
import 'package:http/http.dart ' as http;
import 'package:th_flutter/Model/product.dart';
import 'package:th_flutter/Model/store.dart';
import '../DBHelper/userdb.dart';
import 'cart.dart';

class DBHelper {
  static const String cartUrl = 'http://10.0.2.2:3000/api/user/order';
  static const String _productUrl = "http://10.0.2.2:3000/api/product";
  static const String _storeUrl = "http://10.0.2.2:3000/api/store";

  static Future<Response> checkOut() async {
    Cart cart = Cart();
    return await http.post(
        headers: {"content-type": "application/json"},
        Uri.parse('$cartUrl/${UserDB.currentUser!.id}'),
        body: jsonEncode(cart.toMap()));
  }

  static Future<List<Product>> getProducts() async {
    var res = await http.get(Uri.parse(_productUrl));
    if (res.statusCode == 200) {
      List<dynamic> result = jsonDecode(res.body);

      List<Product> products = result.map((element) {
        return Product.fromJson(element);
      }).toList();
      return products;
    }
    return [];
  }

  static Future<Product?> getProductAt(int id) async {
    Response res = await http.get(Uri.parse("$_productUrl/$id"));
    if (res.statusCode == 200) {
      Product product = Product.fromJson(jsonDecode(res.body));
      product.image = getImage(product.imageName, 400, 400);
      return product;
    } else {
      return null;
    }
  }

  static Future<List<Store>> getStores() async {
    var res = await http.get(Uri.parse(_storeUrl));

    if (res.statusCode == 200) {
      List<dynamic> result = jsonDecode(res.body);
      List<Store> stores = result.map((e) => Store.fromJson(e)).toList();

      return stores;
    }
    return [];
  }

  static Future<List<dynamic>> search(String searchString) async {
    var res = await http.get(Uri.parse('$_productUrl/find/$searchString'));

    if (res.statusCode == 200) {
      Map body = jsonDecode(res.body);
      List<dynamic> result = [];
      result = body['products'].map((e) => Product.fromJson(e)).toList();

      result.addAll(body['stores'].map((e) => Store.fromJson(e)).toList());
      return result;
    }
    return [];
  }

  static Image getImage(String imageName, double width, double height) {
    return Image.network(
      'http://10.0.2.2:3000/api/image/$imageName',
      fit: BoxFit.contain,
      width: width,
      height: height,
    );
  }
}
