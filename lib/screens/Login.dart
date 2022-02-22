import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inception_lab/models/phone_auth.dart';
import 'package:inception_lab/screens/home.dart';
import 'package:inception_lab/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Phone_Auth phone_auth = Phone_Auth();
  get verify => phone_auth.verification_ID;
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
                Get.offAll(() => home());
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
          // verify != ""
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
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Please type the verification code sent to\n${_selectedCountry.toString()}${phonecontroller.text}",
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
                            style: TextStyle(color: Colors.black, fontSize: 18),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => home()));
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
          :
          // Padding(
          // padding: EdgeInsets.only(left: 26.w, right: 53.w),
          // child:
          Column(
              children: [
                SizedBox(
                  height: 141.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 26.w, right: 53.w),
                    child: Text(
                      "Enter Mobile\nNumber",
                      style: TextStyle(fontSize: 36.41.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 26.w, right: 80.w),
                    child: Text(
                      "Enter your phone number to verify\nyour account nd place Order",
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: hei * 0.05,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 26.w, right: 25.w),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: phonecontroller,
                      autofocus: true,
                      decoration: InputDecoration(
                          constraints: BoxConstraints(
                              maxHeight: 65.h, maxWidth: 324.01.w),
                          // contentPadding: EdgeInsets.only(
                          //     top: 22.h,
                          //     bottom: 26.h,
                          //     left: 101.01.w,
                          //     right: 76.w),
                          hintText: "Enter Phone Number",
                          prefix: Container(
                            child: DropdownButtonHideUnderline(
                              child: CountryCodePicker(
                                //enabled: false,
                                initialSelection: "IN",
                                onChanged: (CountryCode code) {
                                  print(code.name);
                                  _selectedCountry = code.dialCode.toString();
                                  print(code.dialCode);
                                },
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 51.h,
                ),
                FlatButton(
                  padding: EdgeInsets.only(
                      top: 21.h, bottom: 15.h, left: 88.w, right: 87.w),
                  // EdgeInsets.symmetric(
                  // horizontal: wid * 0.2, vertical: hei * 0.02),
                  onPressed: () {
                    // phone_auth.Login_with_phone_No(
                    //     "$_selectedCountry${phonecontroller.text}",
                    //     "${otpcontroller.text}");
                    Login_with_Ph_No(
                      "$_selectedCountry${phonecontroller.text}",
                    );
                  },
                  child: Text(
                    "Send OTP",
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ],
            ),
      //),
    );
  }
}
