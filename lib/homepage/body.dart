import 'package:flutter/material.dart';
import 'package:th_flutter/homepage/components/account.dart';
import 'package:th_flutter/homepage/components/favorite.dart';
import 'package:th_flutter/homepage/components/home.dart';
import 'package:th_flutter/homepage/components/notification.dart';

import 'headers/homeheader.dart';
import 'headers/menuheader.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var flag = true;

  var _index = 1;
  final List<Widget> _body = const [
    HomeScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: flag ? const HomeHeader() : const MenuHeader(),
      ),
      body: SafeArea(child: _body[_index]),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
            currentIndex: _index,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 16,
            selectedIconTheme: const IconThemeData(size: 40),
            selectedItemColor: Colors.blue,
            onTap: (value) {
              setState(() {
                _index = value;
                if (_index != 3) {
                  flag = true;
                } else {
                  flag = false;
                }
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favortite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "Notification"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Account"),
            ]),
      ),
    );
  }
}
