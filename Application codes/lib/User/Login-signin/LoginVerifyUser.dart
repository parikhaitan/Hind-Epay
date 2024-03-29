///This files contains the code for OTP verification post entering login credentials

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/User/HomeUser.dart';
import 'package:pinput/pinput.dart';
import 'loginUser.dart';

class LoginVerifyUser extends StatefulWidget {
  const LoginVerifyUser({Key? key}) : super(key: key);

  @override
  State<LoginVerifyUser> createState() => _LoginVerifyUserState();
}

class _LoginVerifyUserState extends State<LoginVerifyUser> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    var code = "";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/Images/Hind e-pay logo.png',
                width: 400,
                height: 350,
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to verify your phone number for getting you back to your account!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                  length: 6,
                  showCursor: true,
                  onChanged: (value) {
                    code = value;
                  }),
              SizedBox(
                height: 1,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(241, 112, 0, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      try {
                        // Create a PhoneAuthCredential with the code
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: LoginUser.verify,
                                smsCode: code);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeUser()));
                      } catch (e) {
                        const snackBar = SnackBar(
                          content: Text("wrong otp"),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print("wrong otp");
                      }
                    },
                    child: Text("Verify Phone Number")),
              ),
              // Row(
              //   children: [
              //     TextButton(
              //         onPressed: () {
              //           Navigator.pushNamedAndRemoveUntil(
              //             context,
              //             'phone',
              //             (route) => false,
              //           );
              //         },
              //         child: Text(
              //           "Edit Phone Number ?",
              //           style: TextStyle(color: Colors.black),
              //         ))
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
