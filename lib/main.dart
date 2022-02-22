import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inception_lab/screens/home.dart';
import 'package:inception_lab/screens/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/Login.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
          title: 'Food...',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:
              //Splash()
              AnimatedSplashScreen(
            splash: Splash(),
            nextScreen:
                // home(),
                Login(),
            animationDuration: Duration(seconds: 3),
            splashIconSize: 2000,
          )
          // Login(),
          ),
    );
  }
}
