import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:th_flutter/cart/cartbutton.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  static String routeName = "/productdetail";
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("product name"),
        actions: const [
          CartButton(
            iconColor: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
                child: Image.asset("assets/dish.png",
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8)),
            const SizedBox(
              height: 20,
            ),
            const Text("Product price",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            const Text("Pruduct description"),
          ],
        ),
      ),
      bottomNavigationBar:
          ElevatedButton(onPressed: () {}, child: const Text("Add to cart")),
    ));
  }
}
