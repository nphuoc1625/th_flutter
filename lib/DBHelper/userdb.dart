import 'dart:convert';

import 'package:th_flutter/Model/user.dart';

import 'package:http/http.dart' as http;

class UserDB {
  static const String _url = "http://10.0.2.2:3000/api/user";

  static MyUser? currentUser;

  static Future<String?> signUp(MyUser user) async {
    var res =
        await http.post(Uri.parse("$_url/signup"), body: MyUser.toMap(user));

    if (res.statusCode == 200) {
      return null;
    } else {
      return res.body;
    }
  }

  static Future<String?> signIn(MyUser user) async {
    var res =
        await http.post(Uri.parse("$_url/signin"), body: MyUser.toMap(user));
    if (res.statusCode == 200) {
      currentUser = MyUser.fromJson(jsonDecode(res.body));
      return null;
    } else {
      return res.body;
    }
  }

  static Future<bool> checkIfLiked(String userId, int productId) async {
    var res = await http.get(Uri.parse("$_url/favorite/$userId/$productId"));
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> disLike(String userId, int productId) async {
    http.post(Uri.parse("$_url/favorite/remove"),
        body: jsonEncode(
            Map<String, dynamic>.from({'id': productId, 'userId': userId})));
  }

  static Future<void> like(String userId, int productId) async {
    http.post(Uri.parse("$_url/favorite/add"),
        body: jsonEncode(
            Map<String, dynamic>.from({'id': productId, 'userId': userId})));
  }

  static void signOut() {
    currentUser = null;
  }
}
