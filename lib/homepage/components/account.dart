import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:th_flutter/signin/signinpage.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushNamedAndRemoveUntil(
            context,
            SignInPage.routeName,
            (route) {
              return false;
            },
          );
        },
        child: Text("log out"));
  }
}
