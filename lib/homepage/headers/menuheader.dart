import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../signin/signinpage.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Text("Account Info")),
        TextButton(
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
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
