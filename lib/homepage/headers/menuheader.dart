import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Text("Account Info")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
