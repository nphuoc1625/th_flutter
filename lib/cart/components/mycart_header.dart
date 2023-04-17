import 'package:flutter/material.dart';

PreferredSizeWidget? header(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: const Text(
      "My Cart",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
