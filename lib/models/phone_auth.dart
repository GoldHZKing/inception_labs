import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inception_lab/screens/home.dart';
import 'package:inception_lab/services/loading.dart';

class Phone_Auth {
  String? verification_ID;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future Login_with_phone_No(String mobile, String otpcont) async {
    await _auth.verifyPhoneNumber(
        timeout: Duration(seconds: 100),
        phoneNumber: mobile,
        verificationCompleted: (PhoneAuthCredential credential) async {
          otpcont = credential.smsCode ?? "";

//onLoading(context: context,value: "HHH");
          print("Verification completed////${credential.smsCode}");
          print(mobile);
          await _auth
              .signInWithCredential(credential)
              .then((value) => Get.offAll(() => home()))
              .onError((error, stackTrace) {
            showToastMsg(error);
            print(error.toString());
          });
        },
        verificationFailed: (FirebaseAuthException q) {
          print("Error///////${q.toString()}");
        },
        codeSent: (String verification, int? resendtoken) {
          verification_ID = verification;
          showToastMsg("OTP Sent");

          print("////////////////verification CS code: " + verification_ID!);
        },
        codeAutoRetrievalTimeout: (String verification_ID) {
          showToastMsg("OTP Auto Retrieval Failed");
          print("verification AR code: " + verification_ID);
          verification_ID = "";
        });
  }
}
