///This is the register screen for the users who have not registered previosly

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hind_e_pay/CommonScreens/reusable_widget.dart';
import '../../Backend/RegisterController.dart';
import 'registerVerifyUser.dart';

class RegisterUser extends StatelessWidget {
  static final String title = 'REGISTER';
  static String verify = "";
  static TextEditingController phoneNoCode = TextEditingController();

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: RegisterUserMainPage(),
      );
}

class RegisterUserMainPage extends StatefulWidget {
  @override
  _RegisterUser createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterUserMainPage> {
  final controller = Get.put(RegisterController());
  final selectedValue = "Government";
  int price = 2;
  bool isuploaded = false;
  final myController = TextEditingController();

  @override
  void initState() {
    TextEditingController countryController = TextEditingController();
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var phone = "";
    return Scaffold(
      appBar: reusableAppBarOpp(
          MediaQuery.of(context).size.width, "REGISTER", context),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // SizedBox(height: 13),
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 0.2 * MediaQuery.of(context).size.height,
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
                              image: AssetImage(
                                  'Assets/Images/Hind e-pay logo.png'),
                              scale: 0.05,
                              alignment: Alignment.center,
                            ),
                          ), //     color: Color(0xfffff5f5),
                        ),
                        // SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                        ReusableTextFieldWithTitle(
                            context, "User Name", controller.userName, "ABC"),
                      ],
                    ),
                    SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    Column(
                      children: [
                        Container(
                          width: 0.9 * MediaQuery.of(context).size.width,
                          height: 0.15 * MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('Assets/Images/bg screen.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 8),
                              Flexible(
                                child: Text("Phone Number",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xfffff5f5),
                                    )),
                              ),
                              Container(
                                width: 0.8 * MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color(0xfffff5f5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: TextField(
                                        //  controller: phoneNoCode,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "+91"),
                                      ),
                                    ),
                                    Text(
                                      "|",
                                      style: TextStyle(
                                          fontSize: 33, color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: TextField(
                                      controller: controller.phoneNo,
                                      keyboardType: TextInputType.phone,
                                      onChanged: (value) {
                                        phone = value;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phone Number",
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    Column(
                      children: [
                        ReusableTextFieldWithTitle(context, "EMAIL ID",
                            controller.emailId, "abc@gmail.com"),
                      ],
                    ),
                    SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    FloatingActionButton.extended(
                      heroTag: "Done",
                      onPressed: () async {
                        final String number =
                            '${"+91" + controller.phoneNo.text}';
                        print(number);

                        //Do not registers if the phone number is previously registered
                        if (checkPhoneNumberRegistered(number, "users") ==
                            true) {
                          const snackBar = SnackBar(
                            content: Text(
                                'Please login! Phone Number  already registered!'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          print(
                              "Please login! Phone Number  already registered");
                        }
                        else {
                       //   await FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: number,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterVerify()));
                              RegisterUser.verify = verificationId;
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        }
                      },
                      label: Text('Verify Details'),
                      backgroundColor: Color(0xff20c215),
                    ),
                  ],
                ),
                Text("OR"),

                TextButton(
                  onPressed: () {},
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Already have an account?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(text: "Login".toUpperCase())
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //function to check whether phone number is previously registered is defined here
  Future<bool> checkPhoneNumberRegistered(
      String phoneNumber, String collection) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await _firestore
        .collection(collection)
        .where('Phone No', isEqualTo: phoneNumber)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Phone number is already registered
      print('Phone number is already registered.');
      return true;
    } else {
      // Phone number is not registered
      print('Phone number is not registered.');
      return false;
    }
  }
}
