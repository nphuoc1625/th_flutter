import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../homepage/homepage.dart';
import 'components/body.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
  }

  void checkIfUserLoggedIn(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => checkIfUserLoggedIn(context));
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
