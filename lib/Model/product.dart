import 'package:flutter/material.dart';

class Product {
  String description, title, imageName;
  // ignore: prefer_final_fields
  int _id, storeId, price;

  Image? image;

  Product(this.description, this._id, this.title, this.imageName, this.storeId,
      this.price);
  int get id {
    return _id;
  }

  Product.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        storeId = json['storeId'],
        price = json['price'],
        description = json['description'],
        title = json['title'],
        imageName = json['imageName'];
}
