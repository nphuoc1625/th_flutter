import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:th_flutter/Model/product.dart';

import '../../productdetail/productdetail.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin {
  List<Product> products = [];

  getFavorites() async {
    products = [];
    //get Favorite ids
    DataSnapshot favoriteIdList = await FirebaseDatabase.instance
        .ref("user")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child("favorite")
        .get();
    if (favoriteIdList.exists) {
      for (DataSnapshot favoriteId in favoriteIdList.children) {
        DataSnapshot productData = await FirebaseDatabase.instance
            .ref("product")
            .child(favoriteId.key!)
            .get();
        //if exist product, get data
        if (productData.exists) {
          Product p =
              Product.fromJson(productData.value as Map<String, dynamic>);
          //get product image
          FirebaseStorage.instance
              .ref("product")
              .child(p.imageName)
              .getData()
              .then((value) {
            if (value != null) {
              p.image = Image.memory(value, height: 100, width: 100);
              if (mounted) setState(() {});
            }
          });
          if (mounted) setState(() => products.add(p));
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  bool result = await Navigator.pushNamed(
                      context, ProductDetailPage.routeName,
                      arguments: products[index].id) as bool;
                  if (!result) {
                    getFavorites();
                    setState(() {});
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      products[index].image != null
                          ? products[index].image!
                          : const CircularProgressIndicator(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[index].title),
                              Text("${products[index].price}"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
