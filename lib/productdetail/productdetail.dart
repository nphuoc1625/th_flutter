import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:th_flutter/DBHelper/productdb.dart';
import 'package:th_flutter/Model/cart_item.dart';
import '../DBHelper/userdb.dart';
import '../Model/cart.dart';
import '../Model/product.dart';
import 'components/productdetail_header.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  static String routeName = "/productdetail";

  @override
  State createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State {
  Product? product;
  bool _isFavorrite = false;

  void getProductInfo() {
    int id = ModalRoute.of(context)!.settings.arguments as int;

    ProductDB.getProductAt(id).then((value) {
      setState(() {
        product = value!;
      });
      if (product != null) {
        FirebaseStorage.instance
            .ref("product")
            .child(product!.imageName)
            .getData()
            .then((value) {
          product!.image = Image.memory(
            width: 150,
            fit: BoxFit.fitHeight,
            height: 150,
            value!,
          );
          if (mounted) {
            setState(() {});
          }
        });
      }
    });
  }

  void checkIfAddedFavorite() {
    int productId = ModalRoute.of(context)!.settings.arguments as int;
    String userId = UserDB.currentUser!.id!;

    UserDB.checkIfLiked(userId, productId)
        .then((value) => {_isFavorrite = value});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getProductInfo();
      checkIfAddedFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: header(context, _isFavorrite, product),
        body: product != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        color: Colors.grey[300],
                        padding: const EdgeInsets.all(8),
                        height: 200,
                        child: product!.image ??
                            Image.asset(
                              "assets/dish.png",
                              fit: BoxFit.fitHeight,
                              width: 150,
                              height: 150,
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(children: [
                      Text(
                        product != null ? "${product!.price}" : "",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => onHeartClicked(),
                        icon: Icon(_isFavorrite
                            ? Icons.favorite
                            : Icons.favorite_border),
                      )
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(product != null ? product!.description : ""),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()),
        bottomNavigationBar: product != null
            ? bottom()
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget bottom() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            Cart cart = Cart();
            cart.addItem(CartItem(product!, 1));
          },
          child: const Text("Add to cart")),
    );
  }

  onHeartClicked() {
    int productId = ModalRoute.of(context)!.settings.arguments as int;
    String userId = UserDB.currentUser!.id!;

    setState(() {
      _isFavorrite = !_isFavorrite;
    });

    if (_isFavorrite) {
      UserDB.disLike(userId, productId);
    } else {
      UserDB.like(userId, productId);
    }
  }
}
