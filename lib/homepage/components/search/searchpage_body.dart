import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  TextEditingController controller = TextEditingController();

  List<String> tags = [];
  List<String> options = ['food', 'drink', 'coffee'];

  Widget buildTag(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Reccomended"),
          const SizedBox(
            height: 10,
          ),
          ChipsChoice<String>.multiple(
              direction: Axis.horizontal,
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options,
                value: (i, v) => v,
                label: (i, v) => v,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No result"));
  }
}
