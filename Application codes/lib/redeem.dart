import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'User/passCodeSetterUser.dart';
import 'User/viewVoucher.dart';

class Redeem extends StatefulWidget {
  const Redeem({Key? key}) : super(key: key);

  @override
  State<Redeem> createState() => _RedeemState();
}

class _RedeemState extends State<Redeem> {
  final id = PasscodeSetterUser.id;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future<void> get_redeemed() async {
      CollectionReference db =
      FirebaseFirestore.instance.collection('Vouchers');

      QuerySnapshot snapshot =
      await db.where('Nid', isEqualTo: ViewVouchers.code).get();

      for (var document in snapshot.docs) {
        String documentId = document.id;
        db.doc(documentId).delete().then(
              (doc) => AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.bottomSlide,
            showCloseIcon: true,
            title: "Success",
            desc: "Voucher has been redeemed.",
            btnOkOnPress: () {},
          )..show(),
          onError: (e) => print("Error redeeming$e"),
        );
      }

      CollectionReference user_db =
      FirebaseFirestore.instance.collection('users');

      QuerySnapshot user_snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(id)
          .collection("User_Vouchers")
          .where('Nid', isEqualTo: ViewVouchers.code)
          .get();
      for (var document in user_snapshot.docs) {
        String documentId = document.id;
        await user_db
            .doc(id)
            .collection("User_Vouchers")
            .doc(documentId)
            .update({
          'Nid': 'Null',
        });
      }
    }
    //           (doc) => AwesomeDialog(
    //         context: context,
    //         dialogType: DialogType.success,
    //         animType: AnimType.bottomSlide,
    //         showCloseIcon: true,
    //         title: "Success",
    //         desc: "Voucher has been redeemed.",
    //         btnOkOnPress: () {},
    //       )..show(),
    //       onError: (e) => print("Error redeeming$e"),
    //     );
    //   }
    //
    //   CollectionReference user_db =
    //   FirebaseFirestore.instance.collection('User Vouchers');
    //
    //   QuerySnapshot user_snapshot =
    //   await user_db.where('Nid', isEqualTo: ViewVouchers.code).get();
    //   for (var document in user_snapshot.docs) {
    //     String documentId = document.id;
    //     await user_db.doc(documentId).update({
    //       'Nid': 'Null',
    //     });
    //   }
    // }
    //


    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
                'assets/AEM_logo.png',
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
                "Please enter the otp to redeem the voucher! ",
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
                  }

                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                //onCompleted: (pin) => print(pin),
              ),
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
                            verificationId: ViewVouchers.verify,
                            smsCode: code);
                        get_redeemed();
                      } catch (e) {
                        print("Error");
                      }
                    },
                    child: Text("AUTHENTICATE")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'phone',
                              (route) => false,
                        );
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}