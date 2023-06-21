///This screen is viewing the E-Rupi Vouchers that we added in our application in the add Voucher option -- redeeming is done using OTP vefication
///Grey colored vouchers are previously redeemed or expired voucher and orange are yet to redeem

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login-signin/passCodeSetterUser.dart';
import '../CommonScreens/reusable_widget.dart';
import 'redeem.dart';

class ViewVouchers extends StatefulWidget {
  static String code = '';
  static String verify = "";
  @override
  _ViewVouchers createState() => _ViewVouchers();
}

class _ViewVouchers extends State<ViewVouchers> {
  final String id = PasscodeSetterUser
      .id; // Add the 'String' type to the variable declaration
  late Stream<QuerySnapshot<Map<String, dynamic>>> user_stream;

  @override
  void initState() {
    super.initState();
    user_stream = FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("User_Vouchers")
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    Future<String?> openDialogAsk() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                title: Text(
                  "Redeem this voucher?",
                  style: TextStyle(fontSize: 20),
                ),
                actions: [
                  TextButton(
                    child: Text("YES, redeem."),
                    onPressed: () {
                      print(ViewVouchers.code);
                    },
                  ),
                  TextButton(
                    child: Text("NO, go back."),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]));

    return Scaffold(
        appBar: reusableAppBarOpp(
            MediaQuery.of(context).size.width, "YOUR VOUCHERS", context),
        backgroundColor: Color(0xfffff5f5),
        body: StreamBuilder<QuerySnapshot>(
            stream: user_stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Connection error.");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading...");
              }

              var docs = snapshot.data!
                  .docs; // Cast snapshot.data to QuerySnapshot and access docs
              //return Text('${docs.length}');
              Color titleColor =
                  Colors.black; // Define a variable to hold the title color

              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      leading: Icon(CupertinoIcons.ticket_fill,
                          size: 35, color: Color(0xfff16f00)),
                      tileColor: docs[index]['Nid'] == 'Null'
                          ? Color(0xff898179)
                          : Color(0xffffc896),
                      title: Text(
                        docs[index]['Code'],
                        style: TextStyle(
                            color: titleColor,
                            fontSize: 20), // Apply the title color
                      ),
                      // tileColor:  state == 'Active' ? Color(0xffffc896) : Color(0xff898179),
                      subtitle: Text(
                          'Amount: ${docs[index]['Amount']}\nPurpose: ${docs[index]['Service']}\nExpiration Date: ${docs[index]['Expiration Date']}',
                          style: TextStyle(
                              color: Color(0xff262626), fontSize: 15)),
                      onTap: () async {
                        if (docs[index]['Nid'] == 'Null') {
                        } else {
                          openDialogAsk();
                          ViewVouchers.code = docs[index]['Nid'];
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: ViewVouchers.code,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              // Navigator.pushNamed(context, 'verify');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Redeem(),
                                  ));
                              ViewVouchers.verify = verificationId;
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        }
                      },
                    ),
                  );
                },
              );
            }
            )
    );
  }
}
