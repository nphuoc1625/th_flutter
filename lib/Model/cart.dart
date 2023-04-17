import 'cart_item.dart';

class Cart {
  static Cart? _instance;
  Cart._internal();
  factory Cart() {
    _instance ??= Cart._internal();
    return _instance!;
  }
  List<CartItem> items = [];

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
      "total_price": totalPrice,
      "date_created":
          "${now.hour}:${now.minute} ${now.day}:${now.month}:${now.year}:",
      "items": items
          .map((e) => {
                "${e.item.id}": {"quantity": e.quantity, "total": e.total}
              })
          .fold<Map<String, dynamic>>({}, (previousValue, element) {
        previousValue.addAll(element);
        return previousValue;
      })
    };

    return map;
  }
}
