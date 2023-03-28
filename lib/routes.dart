import 'package:flutter/cupertino.dart';
import 'package:th_flutter/homepage/homepage.dart';
import 'package:th_flutter/productdetail/productdetail.dart';
import 'package:th_flutter/signin/signinpage.dart';
import 'package:th_flutter/signup/signuppage.dart';

final Map<String, WidgetBuilder> routes = {
  SignInPage.routeName: (context) => const SignInPage(),
  SignUpPage.routeName: (context) => const SignUpPage(),
  HomePage.routeName: (context) => const HomePage(),
  ProductDetailPage.routeName: (context) => const ProductDetailPage()
};
