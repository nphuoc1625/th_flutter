import 'package:flutter/material.dart';
import 'package:th_flutter/Model/onclick.dart';

import 'cartbutton.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader(this.onClick, {super.key});
  final OnClick onClick;

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _search,
                    onTap: () => widget.onClick.onClick(),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Find your food here",
                        border: InputBorder.none),
                    onEditingComplete: () {},
                  ),
                ),
                IconButton(
                    onPressed: () {
                      widget.onClick.onSearch(_search.text);
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
        ),
        const CartButton(
          iconColor: Colors.grey,
        ),
      ]),
    );
  }
}
