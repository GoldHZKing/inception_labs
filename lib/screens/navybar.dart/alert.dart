import 'package:flutter/material.dart';
class Alert extends StatefulWidget {
  Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Alert Page"),),);
  }
}