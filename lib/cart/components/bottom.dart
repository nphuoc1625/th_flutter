import 'package:flutter/material.dart';

import '../../Model/onclick.dart';

class BottomCartPage extends StatefulWidget {
  const BottomCartPage(this.totalPrice, this.clickInterface, {super.key});

  final int totalPrice;

  final OnClick clickInterface;
  @override
  State<BottomCartPage> createState() => _BottomCartPageState();
}

class _BottomCartPageState extends State<BottomCartPage> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.totalPrice}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          TextButton(
            onPressed: () => widget.clickInterface.onClick(),
            child: Text(
              "Checkout",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
