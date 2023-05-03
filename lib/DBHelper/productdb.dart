import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
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
