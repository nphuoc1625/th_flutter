import 'package:flutter/cupertino.dart';

class Store {
  int id;
  String title;
  String imageName;
  Image? image;
  Store(this.id, this.title, this.imageName);

  Store.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageName = json['imageName'];
}
