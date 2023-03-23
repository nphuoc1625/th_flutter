import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeStore extends StatefulWidget {
  const HomeStore({super.key});

  @override
  State<HomeStore> createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  @override
  Widget build(BuildContext context) {
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
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
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
