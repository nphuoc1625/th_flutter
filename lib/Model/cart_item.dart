import 'product.dart';

class CartItem {
  Product item;
  int quantity;
  int get total => item.price * quantity;
  CartItem(this.item, this.quantity);
}
