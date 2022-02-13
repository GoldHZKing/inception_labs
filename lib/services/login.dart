import 'package:firebase_auth/firebase_auth.dart';

class Fb_Service {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future Login_with_Ph_No(String Mobile) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: Mobile,
        timeout:Duration(seconds: 60) ,
        verificationCompleted: (T) {},
        verificationFailed: (T) {},
        codeSent: (String a, int) {},
        codeAutoRetrievalTimeout: (T) {});
  }
}
