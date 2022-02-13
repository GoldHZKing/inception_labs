import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Splash_View() {
    Future.delayed(
      const Duration(milliseconds: 5),
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => home()));
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Image.asset(
      "assets/images/splash.png",
      width: double.infinity,
      fit: BoxFit.fitWidth,
    ));
  }
}
