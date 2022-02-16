import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';

void showToastMsg(var msg) {
  Fluttertoast.showToast(
      msg: msg != null ? msg : "Somthing went Wrong",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}

void onLoading({required BuildContext context, String? value}) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
              child: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child:  Row(
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                ),
                const SizedBox(
                  width: 20,
                ),
                 Text(
                  value ?? "Loading . . .",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          )),
        );
      });
}
