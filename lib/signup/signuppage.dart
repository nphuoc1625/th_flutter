import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './components/body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.green,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          "Signup",
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: const Body(),
    );
  }
}