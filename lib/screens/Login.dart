import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inception_lab/screens/home.dart';
import 'package:inception_lab/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _selectedCountry = "+91";
  String verificationId = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  Future Login_with_Ph_No(
    String Mobile,
  ) async {
    print(Mobile);
    await _auth
        .verifyPhoneNumber(
            phoneNumber: Mobile,
            timeout: Duration(seconds: 60),
            verificationCompleted: (PhoneAuthCredential credential) async {
             
              otpcontroller.text = credential.smsCode ?? "";
              onLoading(context: context, value: "Signing In");
              print("Verifcation Complete ${credential.smsCode}");
              await _auth.signInWithCredential(credential).then((value) async {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => home()));
              }).onError((error, stackTrace) {
                print(error);
                showToastMsg(null);
              });
            },
            verificationFailed: (FirebaseAuthException e) {
              print("Error:: $e");

              showToastMsg(e.message);
              if (e.code == 'invalid-phone-number') {
                print('The provided phone number is not valid.');
              }
            },
            codeSent: (String verificationIdd, int? resendToken) {
              verificationId = verificationIdd;
              setState(() {});

              showToastMsg("OTP Sent");
              print("verification CS code: " + verificationId);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              showToastMsg("OTP Auto Retrieval Failed");
              print("verification AR code: " + verificationId);
              verificationId = "";
              setState(() {});
            })
        .onError((error, stackTrace) {
      showToastMsg(error);
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;

    return Scaffold(
        body: verificationId != ""
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: wid * 0.1),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Verification Code",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: hei * 0.015,
                      ),
                      Container(
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Please type the verification code sent to\nyour Mobile Number",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: hei * 0.02,
                      ),
                      Container(
                        //padding: EdgeInsets.symmetric(horizontal: wid * 0.1),
                        child: PinFieldAutoFill(
                          controller: otpcontroller,
                          codeLength: 6,
                          onCodeChanged: (code) {},
                          onCodeSubmitted: (code) {},
                        ),
                      ),
                      SizedBox(
                        height: hei * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "I don't recieve a code! ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: "Please Resend",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: hei * 0.05,
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: wid * 0.2, vertical: hei * 0.02),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => home()));
                          });
                        },
                        child: Text(
                          "Verify OTP",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(left: wid * 0.06),
                child: Column(
                  children: [
                    SizedBox(
                      height: hei * 0.2,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter Mobile\nNumber",
                        style: TextStyle(fontSize: hei * 0.05),
                      ),
                    ),
                    SizedBox(
                      height: hei * 0.01,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter your phone number to verify\nyour account nd place Order",
                        style:
                            TextStyle(fontSize: hei * 0.02, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: hei * 0.05,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: wid * 0.88,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: phonecontroller,
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: "Enter Phone Number",
                              prefix: DropdownButtonHideUnderline(
                                child: CountryCodePicker(
                                  enabled: false,
                                  initialSelection: "IN",
                                  onChanged: (CountryCode code) {
                                    print(code.name);
                                    _selectedCountry = code.dialCode.toString();
                                    print(code.dialCode);
                                  },
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: hei * 0.05,
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: wid * 0.2, vertical: hei * 0.02),
                      onPressed: () {
                        Login_with_Ph_No(
                          "$_selectedCountry${phonecontroller.text}",
                        );
                      },
                      child:  Text(
                              "Send OTP",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
              ));
  }
}
