import 'package:flutter/material.dart';

class Store {
  int id;
  String title;
  String imageName;
  Image? image;
  Store(this.id, this.title, this.imageName);

  Store.fromJson(Map<dynamic, dynamic> json)
      : id = json['_id'],
        title = json['title'],
        imageName = json['imageName'];
}
