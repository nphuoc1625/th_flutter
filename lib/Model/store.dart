import 'package:flutter/cupertino.dart';

class Store {
  int id;
  String title;
  String imageName;
  String? imageLink;
  Store(this.id, this.title, this.imageName);

  Store.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageName = json['imageName'];
}
