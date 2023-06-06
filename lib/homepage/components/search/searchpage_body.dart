import 'package:flutter/material.dart';
import 'package:th_flutter/Model/dbhelper.dart';

import '../../../Model/product.dart';
import '../../../Model/store.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody(this.result, {super.key});

  final List<dynamic> result;

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  TextEditingController controller = TextEditingController();

  // List<String> _selected = [];
  // List<String> options = ['food', 'drink', 'coffee'];
  // Widget tags = const Text("Reccomended tags");

  @override
  void initState() {
    super.initState();

    // setState(() {
    //   tags = buildTag(context);
    // });
  }

  // Widget buildTag(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     width: MediaQuery.of(context).size.width,
  //     color: Colors.white,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("Reccomended tags"),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         // ChipsChoice<String>.multiple(
  //         //     direction: Axis.horizontal,
  //         //     value: _selected,
  //         //     onChanged: (val) => setState(() => _selected = val),
  //         //     choiceItems: C2Choice.listFrom<String, String>(
  //         //       source: options,
  //         //       value: (i, v) => v,
  //         //       label: (i, v) => v,
  //         //     ))
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          // tags,
          Expanded(
              child: ListView.builder(
                  itemCount: widget.result.length,
                  itemBuilder: (context, index) =>
                      (widget.result[index].runtimeType == Store
                          ? buildStoreItem(widget.result[index])
                          : buildProductItem(widget.result[index]))))
        ],
      ),
    );
  }

  Widget buildStoreItem(Store store) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: DBHelper.getImage(store.imageName, 150, 150),
        ),
        Expanded(
          flex: 7,
          child: Text(store.title),
        )
      ],
    );
  }

  Widget buildProductItem(Product product) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: DBHelper.getImage(product.imageName, 150, 150),
        ),
        Expanded(
          flex: 7,
          child: Text(product.title),
        )
      ],
    );
  }
}
