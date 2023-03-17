import 'dart:js_util';

class Ultilites {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Please enter your email";
    }

    RegExp regExp = RegExp(r"^\S+@\S+$");

    if (!regExp.hasMatch(email)) {
      return "Invalid Email";
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Enter your password";
    }
    if (password.length < 8) {
      return "Password is too short";
    }
    return null;
  }

  static String? conformPassword(String password, String conformPassword) {
    if (notEqual(password, conformPassword)) {
      return "Conform password not match";
    }
    return null;
  }
}
