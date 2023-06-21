///The splash screen of the application -- first occuring screen

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/CommonScreens/selectRole.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String KEYLOGIN = 'login';

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin(context);
  }
  //
  // _navigatetohome() async {
  //   await Future.delayed(Duration(milliseconds: 3000), () {});
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SecondScreen()));
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              color: Color(0xfffff5f5),
              image: DecorationImage(
                image: AssetImage('Assets/Images/Hind e-pay logo.png'),
                scale: 0.1,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void isLogin(BuildContext context) {
    whereToGo(context);
  }

  void whereToGo(BuildContext context) async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(SplashScreen.KEYLOGIN);

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SelectRole()));
      // if (isLoggedIn != null) {
      //   if (isLoggedIn) {
      //     Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => SelectRole(),
      //         ));
      //   } else {
      //     Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => SelectRole(),
      //         ));
      //   }
      // } else {
      //   Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => SelectRole(),
      //       ));
      // }
    });
  }
}
