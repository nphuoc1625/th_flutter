import 'package:th_flutter/DBHelper/userdb.dart';

import 'cart_item.dart';

class Cart {
  List<CartItem> items = [];

  static Cart? _instance;

  Cart._internal();

  factory Cart() {
    _instance ??= Cart._internal();
    return _instance!;
  }

  int get totalPrice {
    return items.fold(
        0, (sum, element) => sum + (element.item.price * element.quantity));
  }

  void addItem(CartItem item) {
    final index =
        items.indexWhere((element) => element.item.id == item.item.id);
    if (index != -1) {
      items[index].quantity += item.quantity;
    } else {
      items.add(item);
    }
  }

  void removeItem(CartItem item) {
    items.remove(item);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map;
    DateTime now = DateTime.now();
    map = {
      "userId": UserDB.currentUser!.id,
      "total_price": totalPrice,
      "date_created":
          "${now.hour}:${now.minute} ${now.day}:${now.month}:${now.year}:",
      "items": items
          .map((e) =>
              {"id": e.item.id, "quantity": e.quantity, "total": e.total})
          .toList()
    };

    return map;
  }
}
