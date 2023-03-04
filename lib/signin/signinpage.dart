import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
