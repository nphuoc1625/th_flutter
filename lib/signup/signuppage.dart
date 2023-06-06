import 'package:flutter/material.dart';
import './components/body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          "Signup",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: const Body(),
    );
  }
}
