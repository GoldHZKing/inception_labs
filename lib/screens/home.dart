import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inception_lab/screens/Login.dart';
import 'package:inception_lab/screens/navybar.dart/alert.dart';
import 'package:inception_lab/screens/navybar.dart/fav.dart';
import 'package:inception_lab/screens/navybar.dart/menu.dart';
import 'package:inception_lab/screens/navybar.dart/orders.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future signout() async {
    try {
      _auth.signOut();
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    } on Exception catch (e) {
      // TODO
    }
  }

  List screens = [Menu(), Orders(), Fav(), Alert()];
  int current_Index = 0;

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 56,
        curve: Curves.easeIn,
        iconSize: 24,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        itemCornerRadius: 24,
        selectedIndex: current_Index,
        items: [
          BottomNavyBarItem(
              icon: const Icon(Icons.menu_book_outlined),
              title: const Text("Menu"),
              activeColor: Colors.green,
              textAlign: TextAlign.center,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: const Icon(Icons.check),
              title: const Text("Orders"),
              activeColor: Colors.green,
              textAlign: TextAlign.center,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: const Icon(Icons.link_outlined),
              title: const Text("Fav"),
              activeColor: Colors.green,
              textAlign: TextAlign.center,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: const Icon(Icons.notification_add_outlined),
              title: const Text("Alert"),
              activeColor: Colors.green,
              textAlign: TextAlign.center,
              inactiveColor: Colors.grey),
        ],
        onItemSelected: (index) {
          setState(() {
            current_Index = index;
          });
        },
      ),
      body: screens[current_Index],
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(),
              accountName: Text("Thangaraj"),
              accountEmail: Text("thangarajpandir@outlook.com")),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 15),
            ),
            horizontalTitleGap: wid * 0.008,
            onTap: () {
              signout();
            },
          ),
        ],
      )),
    );
  }
}
