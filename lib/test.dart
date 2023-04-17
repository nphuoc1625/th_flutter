import 'dart:convert';

import 'dart:core';
import 'package:http/http.dart' as http;
import 'Model/product.dart';

const String _productUrl = "http://10.0.2.2:3000/api/product";
const String _storeUrl = "http://10.0.2.2:3000/api/product";
void main() async {
  Product product = (await getProductAt(1))!;
  print(product);
}

Future<Product?> getProductAt(int id) {
  http.get(Uri.parse(_productUrl)).then((res) {
    if (res.statusCode == 200) {
      Product product = Product.fromJson(jsonDecode(res.body));
      return product;
    }
  });

  return Future(() => null);
}
