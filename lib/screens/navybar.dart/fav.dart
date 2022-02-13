import 'package:flutter/material.dart';
class Fav extends StatefulWidget {
  Fav({Key? key}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Fav Page"),),);
  }
}