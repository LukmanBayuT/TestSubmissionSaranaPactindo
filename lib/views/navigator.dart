// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:productsshop/views/favourite.dart';
import 'package:productsshop/views/main_menu.dart';
import 'package:productsshop/views/profile.dart';

class NavigatorUser extends StatefulWidget {
  const NavigatorUser({Key? key}) : super(key: key);

  @override
  State<NavigatorUser> createState() => _NavigatorUserState();
}

class _NavigatorUserState extends State<NavigatorUser> {
  int index = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  var pagesUser = [
    const MainMenu(),
    const MyFav(),
    const MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        height: 50,
        animationCurve: Curves.easeInOutExpo,
        backgroundColor: Colors.transparent,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(
            Icons.list_alt_sharp,
            size: 30,
            color: Colors.amber,
          ),
          Icon(Icons.favorite, size: 30, color: Colors.amber),
          Icon(Icons.person, size: 30, color: Colors.amber),
        ],
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: pagesUser[index]),
    );
  }
}
