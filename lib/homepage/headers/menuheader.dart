import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Text("Account Info")),
        TextButton(onPressed: () {}, child: const Text("Save"))
      ],
    );
  }
}
