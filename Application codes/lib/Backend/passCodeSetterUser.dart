
import "dart:math";
import "package:flutter/material.dart";
import "package:flutter_screen_lock/flutter_screen_lock.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "../HomeUser.dart";
import "../reusable_widget.dart";
import "RegisterController.dart";

class PasscodeSetterUser extends StatefulWidget {
  PasscodeSetterUser({super.key});
  static String password = (1000 + Random().nextInt(9999 + 1)).toString();

  @override
  State<PasscodeSetterUser> createState() => _PasscodeSetterUserState();
}

class _PasscodeSetterUserState extends State<PasscodeSetterUser> {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    final cc = Get.put(RegisterController());

    return Scaffold(
        appBar:reusabbleAppBarToCloseApp("Login"),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
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
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                          primary: Color.fromRGBO(241, 112, 0, 1.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        String name = cc.userName.text.trim();

                        String email = cc.emailId.text.trim();
                        String phoneNo = cc.phoneNo.text.trim();
                        await addUser(name, email, phoneNo);

                        final controller = InputController();
                        screenLockCreate(
                          context: context,
                          inputController: controller,
                          onConfirmed: (value) async {
                            const snackBar = SnackBar(
                              content: Text("Account Created Succesfully"),
                              backgroundColor: Colors.green,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            PasscodeSetterUser.password = value;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeUser()));
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
          ),
        ));
  }

  Future<void> addUser(String userName, String email, String phoneNo) async {
    try {
      // Specify the collection and document ID (optional)
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('Phone No', isEqualTo: phoneNo)
          .get();

      DocumentReference documentRef = _firestore.collection('users').doc();

      if (querySnapshot.docs.isEmpty) {
        // Define the data to be stored in the document
        Map<String, dynamic> data = {
          'UserName': userName,
          'E-mail': email,
          'Phone No.': phoneNo,
          // Add more fields as needed
        };

        // Create the document
        await documentRef.set(data);

        print('Document created with ID: ${documentRef.id}');
      }
    } catch (e) {
      print('Error creating document: $e');
    }
  }
}