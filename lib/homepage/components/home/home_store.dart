import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:th_flutter/Model/store.dart';
import 'dart:convert';

class HomeStore extends StatefulWidget {
  const HomeStore({super.key});

  @override
  State<HomeStore> createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  List<Store> stores = [];

  void getData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child("store");
    DataSnapshot snapshot = await ref.get();
    for (DataSnapshot s in snapshot.children) {
      Store store = Store.fromJson(s.value as Map<String, dynamic>);

      FirebaseStorage.instance
          .ref("store")
          .child(store.imageName)
          .getDownloadURL()
          .then((value) {
        store.imageLink = value;
        setState(() {
          stores.add(store);
        });
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        getData();
      },
    );

    return Column(
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
                    Image.network(stores[index].imageLink!),
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
