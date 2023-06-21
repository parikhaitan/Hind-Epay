///This screen comes post OTP authentication, to set the Passcode for the Service provider


import "dart:math";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screen_lock/flutter_screen_lock.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import '../HomeScreenSP.dart';
import '../../CommonScreens/reusable_widget.dart';
import '../../Backend/RegisterController.dart';

class PasscodeSetterSP extends StatefulWidget {
  PasscodeSetterSP({super.key});
  static String id = "";

  @override
  State<PasscodeSetterSP> createState() => _PasscodeSetterSPState();
}

class _PasscodeSetterSPState extends State<PasscodeSetterSP> {
  var passwordSP = (1000 + Random().nextInt(9999 + 1)).toString();
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    final cc = Get.put(RegisterController());

    return Scaffold(
      appBar: reusabbleAppBarToCloseApp("Login"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.6 * MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Color(0xfffff5f5),
                image: DecorationImage(
                  image: AssetImage('Assets/Images/Hind e-pay logo.png'),
                  scale: 0.05,
                  alignment: Alignment.center,
                ),
              ), //     color: Color(0xfffff5f5),
            ),
            // Flexible(
            SizedBox(
              width: 0.8 * MediaQuery.of(context).size.width,
              child: Text(
                "You're just one step away to experience seemless transactions using E-Rupi!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xfff16f00),
                  fontSize: 22,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(
              height: 0.03 * MediaQuery.of(context).size.height,
            ),
            // ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(241, 112, 0, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  String name = cc.name.text.trim();
                  String orgName = cc.orgName.text.trim();
                  String phoneNo = "+91" + cc.phoneNumber.text.trim();
                  String service = cc.serviceName.text.trim();
                  await addSP(name, orgName, phoneNo, service);

                  final controller = InputController();
                  screenLockCreate(
                    context: context,
                    inputController: controller,
                    onConfirmed: (value) async {
                      passwordSP = value;
                      const snackBar = SnackBar(
                        content: Text("Account Created Succesfully"),
                        backgroundColor: Colors.green,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreenSP()));
                    },
                    footer: TextButton(
                      onPressed: () {
                        // Release the confirmation state and return to the initial input state.
                        controller.unsetConfirmed();
                      },
                      child: const Text('Reset input'),
                    ),
                  );
                },
                child: Text("Set Security Lock")),
          ],
        ),
      ),
    );
  }

  //Adding Service provider credentials info to firebase
  Future<void> addSP(
      String userName, String orgName, String phoneNo, String service) async {
    try {
      // Specify the collection and document ID (optional)
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      QuerySnapshot querySnapshot = await _firestore
          .collection('service-provider')
          .where('Phone No', isEqualTo: phoneNo)
          .get();

      DocumentReference documentRef =
          _firestore.collection('service-provider').doc();

      if (querySnapshot.docs.isEmpty) {
        // Define the data to be stored in the document
        Map<String, dynamic> data = {
          'UserName': userName,
          'Organisation Name': orgName,
          'Phone No': phoneNo,
          'service Name': service
          // Add more fields as needed
        };

        // Create the document
        await documentRef.set(data);
        PasscodeSetterSP.id = documentRef.id;
        print('Document created with ID: ${documentRef.id}');
      }
    } catch (e) {
      print('Error creating document: $e');
    }
  }
}
