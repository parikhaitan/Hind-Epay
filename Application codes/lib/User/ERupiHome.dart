///The users can add and view their vouchers through this screen

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hind_e_pay/User/viewVoucher.dart';
import 'package:flutter/cupertino.dart';
import 'Login-signin/loginUser.dart';
import 'Login-signin/passCodeSetterUser.dart';
import '../CommonScreens/reusable_widget.dart';
import 'dart:async' show Future;

class User_Vouchers extends StatefulWidget {
  @override
  _User_Vouchers createState() => _User_Vouchers();
}

class _User_Vouchers extends State<User_Vouchers> {
  final id = (LoginUser.id == "") ? PasscodeSetterUser.id :LoginUser.id;
  final TextEditingController _nameController = TextEditingController();
  String name = '';
  var record;

  @override
  Widget build(BuildContext context) {

    Future<void> _addVoucher() async {
      final name = _nameController.text.trim();
      if (name.isNotEmpty) {
        try {
          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection("users")
              .doc(id)
              .collection("User_Vouchers")
              .where('Code', isEqualTo: name)
              .get();

          if (querySnapshot.docs.isEmpty) {
            QuerySnapshot snapshot = await FirebaseFirestore.instance
                .collection('Vouchers')
                .where('Code', isEqualTo: name)
                .get();

            if (snapshot.docs.isNotEmpty) {
              snapshot.docs.forEach((doc) async {
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(id)
                    .collection("User_Vouchers")
                    .add({
                  'Code': doc['Code'],
                  'Amount': doc['Amount'],
                  'Expiration Date': doc['Expiration Date'],
                  'Service': doc['Service'],
                  'Nid': doc['Nid'],
                });
              });
              print('Data added');
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.bottomSlide,
                showCloseIcon: true,
                title: "Success",
                desc: "Voucher added successfully.",
                btnOkOnPress: () {},
              )..show();
            } else {
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.bottomSlide,
                  showCloseIcon: true,
                  title: "Error",
                  desc: "Invalid voucher code.",
                  btnOkOnPress: () {},
                  btnOkColor: Colors.red)
                ..show();
            }
          } else {
            AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.bottomSlide,
                showCloseIcon: true,
                title: "Error",
                desc: "Voucher already exists.",
                btnOkOnPress: () {},
                btnOkColor: Colors.red)
              ..show();
          }
          ;
        } catch (e) {
          print('Error fetching Voucher: $e');
        }
      }
    }
    // Future<void> _addVoucher() async {
    //   final name = _nameController.text.trim();
    //   if (name.isNotEmpty) {
    //     try {
    //       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
    //           .collection("users")
    //           .doc(id)
    //           .collection("User_Vouchers")
    //           .where('Code', isEqualTo: name)
    //           .get();
    //
    //       if (querySnapshot.docs.isEmpty) {
    //         QuerySnapshot snapshot = await FirebaseFirestore.instance
    //             .collection('Vouchers')
    //             .where('Code', isEqualTo: name)
    //             .get();
    //
    //         if (snapshot.docs.isNotEmpty) {
    //           snapshot.docs.forEach((doc) async {
    //             DocumentSnapshot userDoc = await FirebaseFirestore.instance
    //                 .collection("users")
    //                 .doc(id)
    //                 .get();
    //             print("${doc['Nid']}${userDoc['Nid']}");
    //             if (doc['Nid'] == userDoc['Nid']) {
    //               await FirebaseFirestore.instance
    //                   .collection("users")
    //                   .doc(id)
    //                   .collection("User_Vouchers")
    //                   .add({
    //                 'Code': doc['Code'],
    //                 'Amount': doc['Amount'],
    //                 'Expiration Date': doc['Expiration Date'],
    //                 'Service': doc['Service'],
    //                 'Nid': doc['Nid'],
    //               });
    //
    //               print('Data added');
    //               AwesomeDialog(
    //                 context: context,
    //                 dialogType: DialogType.success,
    //                 animType: AnimType.bottomSlide,
    //                 showCloseIcon: true,
    //                 title: "Success",
    //                 desc: "Voucher added successfully.",
    //                 btnOkOnPress: () {},
    //               )..show();
    //             } else {
    //               AwesomeDialog(
    //                   context: context,
    //                   dialogType: DialogType.error,
    //                   animType: AnimType.bottomSlide,
    //                   showCloseIcon: true,
    //                   title: "Error",
    //                   desc: "Invalid voucher code.",
    //                   btnOkOnPress: () {},
    //                   btnOkColor: Colors.red)
    //                 ..show();
    //             }
    //           });
    //         } else {
    //           AwesomeDialog(
    //               context: context,
    //               dialogType: DialogType.error,
    //               animType: AnimType.bottomSlide,
    //               showCloseIcon: true,
    //               title: "Error",
    //               desc: "Invalid voucher code.",
    //               btnOkOnPress: () {},
    //               btnOkColor: Colors.red)
    //             ..show();
    //         }
    //       } else {
    //         AwesomeDialog(
    //             context: context,
    //             dialogType: DialogType.error,
    //             animType: AnimType.bottomSlide,
    //             showCloseIcon: true,
    //             title: "Error",
    //             desc: "Voucher already exists.",
    //             btnOkOnPress: () {},
    //             btnOkColor: Colors.red)
    //           ..show();
    //       }
    //       ;
    //     } catch (e) {
    //       print('Error fetching Voucher: $e');
    //     }
    //   }
    // }

    Future<void> _viewVoucher() async {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(id)
            .collection("User_Vouchers")
            .get();
        querySnapshot.docs.forEach((doc) {
          print(
              'Code: ${doc['Code']}, Amount: ${doc['Amount']}, Service: ${doc['Service']}, Expiration Date: ${doc['Expiration Date']}');
        });
      } catch (e) {
        print('Error reading data: $e');
      }
    }

    void submit() {
      Navigator.of(context).pop(_nameController.text);
    }

    Future<String?> openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            title: Text(
              "Voucher Code",
              style: TextStyle(fontSize: 24),
            ),
            content: TextField(
                autofocus: true,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter Code here',
                  labelStyle: TextStyle(
                    color: Color(0xfff16f00), //<-- SEE HERE
                  ),
                )),
            actions: [
              AnimatedButton(
                text: "SUBMIT",
                pressEvent: () {
                  submit();
                  _addVoucher();
                },
              )
            ]));
    return Scaffold(
        appBar: reusableAppBarOpp(
          MediaQuery.of(context).size.width,
          "E RUPI",context
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Container(
          child: Row(
            children: [
              SizedBox(width: 0.05 * MediaQuery.of(context).size.width),
              Column(
                children: [
                  SizedBox(height: 0.07 * MediaQuery.of(context).size.height),
                  SizedBox(
                      height: 0.1 * MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'Assets/Images/E Rupi icon.png',
                        height: 300,
                        width: 300,
                      )),
                  SizedBox(height: 0.06 * MediaQuery.of(context).size.height),
                  GestureDetector(
                    onTap: () async {
                      final name = await openDialog();
                      if (name == null || name.isEmpty) return;
                      setState(() => this.name = name);
                    },
                    child: reusableRowContainerBG(
                      MediaQuery.of(context).size.height,
                      MediaQuery.of(context).size.width,
                      "ADD VOUCHER",
                      Icon(CupertinoIcons.plus_square_fill_on_square_fill,
                          size: 40, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                  GestureDetector(
                    onTap: () {
                      _viewVoucher();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewVouchers()));
                    },
                    child: reusableRowContainerBG(
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                        "VIEW VOUCHERS",
                        Icon(CupertinoIcons.arrow_right_square_fill,
                            size: 40, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ));
    @override
    void dispose() {
      _nameController.dispose();
      super.dispose();
    }
  }
}
//
// class ERupiHome extends StatefulWidget {
//   @override
//   _ERupiHome createState() => _ERupiHome();
// }
//
// class _ERupiHome extends State<ERupiHome> {
//   final id = PasscodeSetterUser.id;
//   final TextEditingController _nameController = TextEditingController();
//   String name = '';
//   var record;
//
//   @override
//   Widget build(BuildContext context) {
//
//     //Adding the coupon code recived on text on our E-Rupi Application for future use
//     Future<void> _addVoucher() async {
//       final name = _nameController.text.trim();
//       if (name.isNotEmpty) {
//         try {
//           QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//               .collection("users")
//               .doc(id)
//               .collection("User_Vouchers")
//               .where('Code', isEqualTo: name)
//               .get();
//
//           if (querySnapshot.docs.isEmpty) {
//             QuerySnapshot snapshot = await FirebaseFirestore.instance
//                 .collection('Vouchers')
//                 .where('Code', isEqualTo: name)
//                 .get();
//             if (snapshot.docs.isNotEmpty) {
//               snapshot.docs.forEach((doc) async {
//                 DocumentSnapshot userDoc = await FirebaseFirestore.instance
//                     .collection("users")
//                     .doc(id)
//                     .get();
//                 print("${doc['Nid']}${userDoc['Nid']}");
//                 if (doc['Nid'] == userDoc['Nid']) {
//                   await FirebaseFirestore.instance
//                       .collection("users")
//                       .doc(id)
//                       .collection("User_Vouchers")
//                       .add({
//                     'Code': doc['Code'],
//                     'Amount': doc['Amount'],
//                     'Expiration Date': doc['Expiration Date'],
//                     'Service': doc['Service'],
//                     'Nid': doc['Nid'],
//                   });
//
//                   print('Data added');
//                   AwesomeDialog(
//                     context: context,
//                     dialogType: DialogType.success,
//                     animType: AnimType.bottomSlide,
//                     showCloseIcon: true,
//                     title: "Success",
//                     desc: "Voucher added successfully.",
//                     btnOkOnPress: () {},
//                   )..show();
//                 } else {
//                   AwesomeDialog(
//                       context: context,
//                       dialogType: DialogType.error,
//                       animType: AnimType.bottomSlide,
//                       showCloseIcon: true,
//                       title: "Error",
//                       desc: "Invalid voucher code.",
//                       btnOkOnPress: () {},
//                       btnOkColor: Colors.red)
//                     ..show();
//                 }
//               });
//             }
//
//             // if (snapshot.docs.isNotEmpty) {
//             //   snapshot.docs.forEach((doc) async {
//             //     await FirebaseFirestore.instance
//             //         .collection("users")
//             //         .doc(id)
//             //         .collection("User_Vouchers")
//             //         .add({
//             //       'Code': doc['Code'],
//             //       'Amount': doc['Amount'],
//             //       'Expiration Date': doc['Expiration Date'],
//             //       'Service': doc['Service'],
//             //       'Nid': doc['Nid'],
//             //     });
//             //   });
//             //   print('Data added');
//             //   AwesomeDialog(
//             //     context: context,
//             //     dialogType: DialogType.success,
//             //     animType: AnimType.bottomSlide,
//             //     showCloseIcon: true,
//             //     title: "Success",
//             //     desc: "Voucher added successfully.",
//             //     btnOkOnPress: () {},
//             //   )..show();
//             // }
//             else {
//               AwesomeDialog(
//                   context: context,
//                   dialogType: DialogType.error,
//                   animType: AnimType.bottomSlide,
//                   showCloseIcon: true,
//                   title: "Error",
//                   desc: "Invalid voucher code.",
//                   btnOkOnPress: () {},
//                   btnOkColor: Colors.red)
//                 ..show();
//             }
//           } else {
//             AwesomeDialog(
//                 context: context,
//                 dialogType: DialogType.error,
//                 animType: AnimType.bottomSlide,
//                 showCloseIcon: true,
//                 title: "Error",
//                 desc: "Voucher already exists.",
//                 btnOkOnPress: () {},
//                 btnOkColor: Colors.red)
//               ..show();
//           }
//           ;
//         } catch (e) {
//           print('Error fetching Voucher: $e');
//         }
//       }
//     }
//
//     //View the status of previously added vouchers
//     Future<void> _viewVoucher() async {
//       try {
//         QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//             .collection("users")
//             .doc(id)
//             .collection("User_Vouchers")
//             .get();
//         querySnapshot.docs.forEach((doc) {
//           print(
//               'Code: ${doc['Code']}, Amount: ${doc['Amount']}, Service: ${doc['Service']}, Expiration Date: ${doc['Expiration Date']}');
//         });
//       } catch (e) {
//         print('Error reading data: $e');
//       }
//     }
//
//     void submit() {
//       Navigator.of(context).pop(_nameController.text);
//     }
//
//     //dialogue box to enter the voucher unique code
//     Future<String?> openDialog() => showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(30.0),
//                   ),
//                 ),
//                 title: Text(
//                   "Voucher Code",
//                   style: TextStyle(fontSize: 24),
//                 ),
//                 content: TextField(
//                     autofocus: true,
//                     controller: _nameController,
//                     decoration: InputDecoration(
//                       labelText: 'Enter Code here',
//                       labelStyle: TextStyle(
//                         color: Color(0xfff16f00), //<-- SEE HERE
//                       ),
//                     )),
//                 actions: [
//                   AnimatedButton(
//                     text: "SUBMIT",
//                     pressEvent: () {
//                       submit();
//                       _addVoucher();
//                     },
//                   )
//                 ]));
//     return Scaffold(
//         appBar: reusableAppBarOpp(
//             MediaQuery.of(context).size.width, "E RUPI", context),
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Container(
//             child: Row(
//               children: [
//                 SizedBox(width: 0.05 * MediaQuery.of(context).size.width),
//                 Column(
//                   children: [
//                     SizedBox(height: 0.07 * MediaQuery.of(context).size.height),
//                     SizedBox(
//                         height: 0.3 * MediaQuery.of(context).size.height,
//                         child: Image.asset(
//                           'Assets/Images/E Rupi icon.png',
//                           height: 300,
//                           width: 300,
//                         )),
//                     SizedBox(height: 0.06 * MediaQuery.of(context).size.height),
//                     GestureDetector(
//                       onTap: () async {
//                         final name = await openDialog();
//                         if (name == null || name.isEmpty) return;
//                         setState(() => this.name = name);
//                       },
//                       child: reusableRowContainerBG(
//                         MediaQuery.of(context).size.height,
//                         MediaQuery.of(context).size.width,
//                         "ADD VOUCHER",
//                         Icon(CupertinoIcons.plus_square_fill_on_square_fill,
//                             size: 40, color: Colors.white),
//                       ),
//                     ),
//                     SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
//                     GestureDetector(
//                       onTap: () {
//                         _viewVoucher();
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ViewVouchers()));
//                       },
//                       child: reusableRowContainerBG(
//                           MediaQuery.of(context).size.height,
//                           MediaQuery.of(context).size.width,
//                           "VIEW VOUCHERS",
//                           Icon(CupertinoIcons.arrow_right_square_fill,
//                               size: 40, color: Colors.white)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//     @override
//     void dispose() {
//       _nameController.dispose();
//       super.dispose();
//     }
//   }
// }
