import 'package:flutter/material.dart';

import '../../cart/cartpage.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.iconColor});
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, MyCart.routeName);
        },
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: iconColor,
        ));
  }
}
