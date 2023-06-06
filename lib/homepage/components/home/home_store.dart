import 'package:flutter/material.dart';
import 'package:th_flutter/Model/dbhelper.dart';
import 'package:th_flutter/Model/store.dart';

class HomeStore extends StatefulWidget {
  const HomeStore({super.key});

  @override
  State<HomeStore> createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  List<Store> stores = [];

  void getData() async {
    DBHelper.getStores().then((value) {
      setState(() {
        stores = value;
      });
      for (int i = 0; i < stores.length; i++) {
        if (mounted) {
          setState(() {
            stores[i].image = DBHelper.getImage(stores[i].imageName, 150, 150);
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
