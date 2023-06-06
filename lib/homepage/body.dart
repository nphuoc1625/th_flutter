import 'package:flutter/material.dart';
import 'package:th_flutter/Model/dbhelper.dart';
import 'package:th_flutter/Model/onclick.dart';
import 'package:th_flutter/homepage/components/account/account.dart';
import 'package:th_flutter/homepage/components/favorite.dart';
import 'package:th_flutter/homepage/components/home/home.dart';
import 'package:th_flutter/homepage/components/notification.dart';
import 'package:th_flutter/homepage/components/search/searchpage.dart';

import 'headers/homeheader.dart';
import 'headers/menuheader.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> implements OnClick {
  var flag = true;

  var _index = 0;
  Widget _searchpage = const SearchPage([]);

  final List<Widget> _body = const [
    HomeScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    AccountScreen(),
  ];

  var isSearching = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isSearching
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ))
            : null,
        backgroundColor: flag ? Colors.white : Colors.blue,
        automaticallyImplyLeading: false,
        title: flag ? HomeHeader(this) : const MenuHeader(),
      ),
      body: SafeArea(child: isSearching ? _searchpage : _body[_index]),
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

  @override
  void onClick() {
    setState(() {
      isSearching = true;
    });
  }

  @override
  void onSearch(String searchText) {
    DBHelper.search(searchText).then((value) {
      setState(() {
        _searchpage = SearchPage(value);
      });
    });
  }
}
