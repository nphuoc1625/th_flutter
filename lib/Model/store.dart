import 'package:flutter/cupertino.dart';

class Store {
  int id;
  String title;
  String imageUrl;
  Store(this.id, this.title, this.imageUrl);

  Store.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageUrl = json['imageUrl'];
}
