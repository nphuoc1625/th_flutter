import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:th_flutter/productdetail/productdetail.dart';

import '../../../routes.dart';

class HomePopularProduct extends StatefulWidget {
  const HomePopularProduct({super.key});

  @override
  State<HomePopularProduct> createState() => _HomePopularProductState();
}

class _HomePopularProductState extends State<HomePopularProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(
          height: 170,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetailPage.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/dish.png",
                          height: 130,
                        ),
                        const Text(
                          "Food ",
                        ),
                        const Text(
                          "100000 ",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ));
            },
          ),
        )
      ],
    );
  }
}
