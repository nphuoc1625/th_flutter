import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:th_flutter/signin/signinpage.dart';
import 'package:th_flutter/signup/signuppage.dart';
import 'package:th_flutter/splashpage/splashpage.dart';

final Map<String, WidgetBuilder> routes = {
  SignInPage.routeName: (context) => const SignInPage(),
  SignUpPage.routeName: (context) => const SignUpPage()
};
