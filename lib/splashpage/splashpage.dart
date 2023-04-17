import 'package:flutter/material.dart';

import '../signin/signinpage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  // void checkIfUserLoggedIn(BuildContext context) {
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, HomePage.routeName, (route) => false);
  //   } else {
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, SignInPage.routeName, (route) => false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, SignInPage.routeName, (route) => false);
      },
    );
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.green),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                          backgroundColor: Colors.white, strokeWidth: 5),
                      SizedBox(height: 5),
                      Text(
                        "loading",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ]))));
  }
}
