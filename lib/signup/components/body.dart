import 'package:flutter/material.dart';
import './signup_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: const [
            SizedBox(height: 100),
            Text(
              "Register Account",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              "Complete your register \n or continue with social media",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green),
            ),
            SignUpForm()
          ]),
        ),
      ),
    );
  }
}
