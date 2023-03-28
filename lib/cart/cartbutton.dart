import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.iconColor});
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: iconColor,
        ));
  }
}
