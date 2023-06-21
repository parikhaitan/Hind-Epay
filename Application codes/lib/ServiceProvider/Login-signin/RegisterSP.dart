///This is the register screen for the service providers who have not registered previosly

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hind_e_pay/CommonScreens/reusable_widget.dart';

import '../../Backend/RegisterController.dart';
import 'registerVerifySP.dart';


class RegisterSP extends StatelessWidget {
  static final String title = 'REGISTER';
  static String verify = "";

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: RegisterSPMainPage(),
  );
}

class RegisterSPMainPage extends StatefulWidget {
  @override
  _RegisterSP createState() => _RegisterSP();
}

class _RegisterSP extends State<RegisterSPMainPage> {
  final controller = Get.put(RegisterController());

  String selectedValue = "Government";
  int price = 2;
  bool isuploaded = false;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Government"), value: "Government"),
      DropdownMenuItem(child: Text("Private"), value: "Private"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    var phone = "+91";
    return Scaffold(
      appBar: reusableAppBarOpp(MediaQuery.of(context).size.width, "REGISTER", context),
      backgroundColor: Colors.white,
      body:Container(
        child:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:  Container(
            width: MediaQuery.of(context).size.width,
            // height: (0.8 * MediaQuery.of(context).size.height),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: 0.02 * MediaQuery.of(context).size.height,),
                    Container(
                      width: 0.9 * MediaQuery.of(context).size.width,
                      height: 0.1 * MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ], // color: Colors.orangeAccent,
                      ),
                      child:Row(

                        children: [
                          SizedBox(height: 10),
                          SizedBox(width: 10),
                          Icon(Icons.account_balance_sharp, size: 45,color: Colors.white),
                          SizedBox(width: 10),
                          // image: ,
                          Flexible(
                            child: Text(
                                'Organisation Type:   ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(width: 3),
                          new DropdownButton(
                              value: selectedValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                });
                                ///backend
                                if (selectedValue == "Government") {
                                  price = 5;
                                }
                                else {
                                  price = 2;
                                }
                              },
                              items: dropdownItems
                          ),
                        ],
                      ),
                    ),
                  ],
                ), SizedBox(height: 13),
                Column(
                  children: [
                    Column(
                      children: [
                        ReusableTextFieldWithTitle(context, "Organisation Name", controller.orgName,"Organisation Name"),
                      ],
                    ),SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    Column(
                      children: [
                        ReusableTextFieldWithTitle(context, "User Name",controller.name , "Your Name"),
                      ],
                    ),
                    SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    Column(
                      children: [
                        ReusableTextFieldWithTitle(context, "Service name", controller.serviceName,"Service Name"),
                      ],
                    ),SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    Column(
                      children: [
                        Container(
                          width: 0.9 * MediaQuery.of(context).size.width,
                          height: 0.15 * MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
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
                                      child:
                                      TextField(
                                        //  controller: phoneNoCode,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "+91"
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
                                          controller: controller.phoneNumber,
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
                       // ReusableTextFieldWithTitle(context, "Phone Number", controller.phoneNumber, "+91XXXXXXXXXX"),
                      ],
                    ),
                    SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    FloatingActionButton.extended(
                      heroTag: "Done",
                      onPressed: () async {
                        String number = '${"+91" + controller.phoneNumber.text}';
                        print(number);

                        if (checkPhoneNumberRegistered(number, "service-provider") == true) {
                          const snackBar = SnackBar(
                            content: Text("Please login! Phone Number  already registered"),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          print("Please login! Phone Number  already registered");
                        }
                        else {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: number,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId,
                                int? resendToken) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterVerifySP()));
                              RegisterSP.verify = verificationId;
                            },
                            codeAutoRetrievalTimeout: (
                                String verificationId) {},
                          );
                        }

                      },
                      label: Text('Confirm Details'),
                      backgroundColor: Color(0xff20c215),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future <bool> checkPhoneNumberRegistered(String phoneNumber, String collection) async {
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
