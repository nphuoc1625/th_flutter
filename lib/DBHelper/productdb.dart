import 'dart:convert';

import 'package:http/http.dart';

import '../Model/product.dart';
import 'package:http/http.dart' as http;

import '../Model/store.dart';

class ProductDB {
  static const String _productUrl = "http://10.0.2.2:3000/api/product";
  static const String _storeUrl = "http://10.0.2.2:3000/api/store";

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
      return product;
    } else {
      return null;
    }
  }

  static Future<List<Store>> getStores() async {
    var res = await http.get(Uri.parse(_storeUrl));

    if (res.statusCode == 200) {
      List<dynamic> result = jsonDecode(res.body);

      List<Store> products = result.map((element) {
        return Store.fromJson(element);
      }).toList();
      return products;
    }
    return [];
  }
}
