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
        children: [
          Row(
            children: [
              const Text(
                "Stores",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              const Expanded(child: SizedBox()),
              TextButton(
                  onPressed: () {},
                  child: const Text("See more",
                      style: TextStyle(fontSize: 20, color: Colors.blue)))
            ],
          ),
          const Divider(),
          const HomeStore(),
          Row(
            children: [
              const Text(
                "Popular products",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              const Expanded(child: SizedBox()),
              TextButton(
                  onPressed: () {},
                  child: const Text("See more",
                      style: TextStyle(fontSize: 20, color: Colors.blue)))
            ],
          ),
          const Divider(),
          const HomePopularProduct()
        ],
      ),
    );
  }
}
