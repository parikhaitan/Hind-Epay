import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hind_e_pay/LoginVerifyUser.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginSP extends StatefulWidget {
  const LoginSP({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<LoginSP> createState() => _LoginSP();
}

class _LoginSP extends State<LoginSP> {
  static TextEditingController countryController = TextEditingController();
  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
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
              Text(
                "Login as Service Provider",
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

                      if(await checkPhoneNumberRegistered(number, "service-provider")==false){
                        print("Number not registered! Please Create Account.");
                        const snackBar = SnackBar(
                          content: Text("Number not registered! Please Create Account."),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }
                      else {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: number,
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            //Navigator.pushNamed(context, 'verify');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginVerifyUser()));
                            LoginSP.verify = verificationId;
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }

                      //
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginVerifyUser()));
                    },
                    child: Text("Back")),
              )
            ],
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
