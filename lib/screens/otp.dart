import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Padding(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
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
            // ignore: deprecated_member_use
            FlatButton(
              padding: EdgeInsets.symmetric(
                  horizontal: wid * 0.2, vertical: hei * 0.02),
              onPressed: () {},
              child: Text(
                "Send OTP",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
          ],
        ),
      ),
    );
  }
}
