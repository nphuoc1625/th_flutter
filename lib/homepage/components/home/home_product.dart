import 'package:flutter/material.dart';
import 'package:th_flutter/DBHelper/productdb.dart';
import 'package:th_flutter/productdetail/productdetail.dart';

import '../../../Model/product.dart';

class HomePopularProduct extends StatefulWidget {
  const HomePopularProduct({super.key});

  @override
  State<HomePopularProduct> createState() => _HomePopularProductState();
}

class _HomePopularProductState extends State<HomePopularProduct> {
  List<Product> products = [];

  void getData() {
    ProductDB.getProducts().then((value) {
      setState(() {
        products = value;
      });

      for (var i = 0; i < products.length; i++) {
        if (mounted) {
          setState(() {
            products[i].image =
                ProductDB.getImage(products[i].imageName, 100, 100);
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65),
            itemCount: products.length,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetailPage.routeName,
                        arguments: products[index].id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        products[index].image ??
                            const CircularProgressIndicator(
                                color: Colors.blue, strokeWidth: 2),
                        Text(
                          products[index].title,
                        ),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          "${products[index].price}",
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}
