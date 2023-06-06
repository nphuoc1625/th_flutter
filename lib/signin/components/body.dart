import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:th_flutter/signin/components/signin_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headerScreen(context),
            Expanded(
              child: const SignInForm(),
            ),
            footerScreen(context),
          ],
        ),
      ),
    ));
  }

  Widget headerScreen(BuildContext context) {
    return Image.asset(
      alignment: Alignment.centerRight,
      "assets/dish.png",
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
    );
  }

  Widget footerScreen(BuildContext context) {
    return Image.asset(
      alignment: Alignment.centerLeft,
      "assets/dish_2.png",
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
    );
  }
}
