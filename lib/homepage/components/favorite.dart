import 'package:flutter/material.dart';
import 'package:th_flutter/DBHelper/userdb.dart';
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
    products = await UserDB.getAllFavorite(UserDB.currentUser!.id!);
    setState(() {});
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
