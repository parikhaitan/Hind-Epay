///This files contains the code of Login Screen for User End

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hind_e_pay/User/Login-signin/LoginVerifyUser.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);
  static String verify = "";
  static String id = "";

  @override
  State<LoginUser> createState() => _LoginUser();
}

class _LoginUser extends State<LoginUser> {
  static TextEditingController countryController = TextEditingController();
  var phone = "";

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/Images/Hind e-pay logo.png',
                height: 0.4 * MediaQuery.of(context).size.height,
                width: 0.8 * MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "Login as User",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Only wallet you need",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        phone = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                      final String number = '${"+91" + phone}';

                      if (await checkPhoneNumberRegistered(number, "users") ==
                          false) {
                        print("Number not registered! Please Create Account.");
                        const snackBar = SnackBar(
                          content: Text(
                              "Number not registered! Please Create Account"),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        //await FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting:true);
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: number,
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            print("running");
                            WidgetsBinding.instance!.addPostFrameCallback((_) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginVerifyUser()));
                            });
                            LoginUser.verify = verificationId;
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }
                    },
                    child: Text("Send the code")),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(241, 112, 0, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.pop(context);

                      //
                    },
                    child: Text("Back")),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Checks whether the number being used to login is previously registered or not! If not it will ask the user to register first
  Future<bool> checkPhoneNumberRegistered(
      String phoneNumber, String collection) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await _firestore
        .collection(collection)
        .where('Phone No', isEqualTo: phoneNumber)
        .get();
    LoginUser.id = querySnapshot.docs[0].id;
    if (querySnapshot.docs.isNotEmpty) {
      // Phone number is already registered
      print('Phone number is already registered.');
      return true;
    } else {
      // Phone number is not registered
      print('Phone number is not registered.');
      print(phone);
      print(phoneNumber);
      return false;
    }
  }
}
