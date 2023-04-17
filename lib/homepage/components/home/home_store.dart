import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:th_flutter/Model/store.dart';

import '../../../DBHelper/productdb.dart';
import '../../../Model/product.dart';

class HomeStore extends StatefulWidget {
  const HomeStore({super.key});

  @override
  State<HomeStore> createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  List<Store> stores = [];

  void getData() {
    ProductDB.getStores().then((value) {
      setState(() {
        stores = value;
      });

      for (var element in stores) {
        FirebaseStorage.instance
            .ref('store')
            .child(element.imageName)
            .getData()
            .then((value) => {
                  if (value != null)
                    if (mounted)
                      setState(() {
                        element.image = Image.memory(
                          value,
                        );
                      })
                });
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
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: stores.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 130,
                      child: stores[index].image ??
                          const CircularProgressIndicator(
                              color: Colors.blue, strokeWidth: 2),
                    ),
                    Text(
                      stores[index].title,
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
