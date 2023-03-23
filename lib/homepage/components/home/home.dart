import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_product.dart';
import 'home_store.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: const [HomeStore(), HomePopularProduct()],
      ),
    );
  }
}
