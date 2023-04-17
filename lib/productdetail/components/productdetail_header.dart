import 'package:flutter/material.dart';
import 'package:th_flutter/Model/product.dart';

import '../../homepage/headers/cartbutton.dart';

PreferredSizeWidget header(
    BuildContext context, bool isFavorrite, Product? product) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context, isFavorrite);
        },
        icon: const Icon(Icons.arrow_back)),
    title: Text(product != null ? product.title : ""),
    actions: const [
      CartButton(
        iconColor: Colors.white,
      )
    ],
  );
}
