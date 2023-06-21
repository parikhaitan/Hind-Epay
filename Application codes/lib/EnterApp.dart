// import 'package:flutter/material.dart';
//
//
// class EnterApp extends StatefulWidget {
//   const EnterApp({Key? key}) : super(key: key);
//
//   @override
//   State<EnterApp> createState() => _EnterApp();
// }
//
// class _EnterApp extends State<EnterApp> {
//   TextEditingController countryController = TextEditingController();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     countryController.text = "+91";
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(left: 25, right: 25),
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'Assets/Images/Hind e-pay logo.png',
//                 width: 400,
//                 height: 350,
//               ),
//               SizedBox(
//                 height: 1,
//               ),
//               Text(
//                 "Phone Verification",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "We need to register your phone without getting started!",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 10,
//                     ),
//                     SizedBox(
//                       width: 40,
//                       child: TextField(
//                         controller: countryController,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       "|",
//                       style: TextStyle(fontSize: 33, color: Colors.grey),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: TextField(
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Phone",
//                           ),
//                         ))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.green.shade600,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'verify');
//                     },
//                     child: Text("Send the code")),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class EnterApp extends StatefulWidget {
// //   const EnterApp({Key? key}) : super(key: key);
// //
// //   @override
// //   State<EnterApp> createState() => _EnterApp();
// // }
// //
// // class _EnterApp extends State<EnterApp> {
// //   @override
// //   void initState(){
// //     super.initState();
// //     //_navigatetohome();
// //   }
// //
// //   _navigatetohome() async {
// //     await Future.delayed(Duration(microseconds: 1500), () {});
// //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EnterApp()));
// //   }
// //
// //   @override
// //
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Builder(builder:(context)=>Scaffold(
// //         body:
// //         Container(
// //           width:MediaQuery.of(context).size.width,
// //           height:(MediaQuery.of(context).size.height),
// //           alignment: Alignment.center,
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
// //
// //             color: Color(0xfff16f00),
// //
// //           ),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               new SizedBox(
// //                 width: MediaQuery.of(context).size.width,
// //                 height: MediaQuery.of(context).size.height * 0.8,
// //                 child:
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     color: Color(0xfffff5f5),
// //                     borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25), ),
// //
// //                     image: DecorationImage(
// //                       image: AssetImage('Assets/Images/Hind e-pay logo.png'),
// //                       scale: 0.1,
// //                       alignment: Alignment.center,
// //                     ),
// //                   ),
// //
// //                 ),
// //               ),
// //               new SizedBox(
// //                 height: (0.05 * MediaQuery.of(context).size.height),
// //               ),
// //
// //               new SizedBox(
// //                   width: MediaQuery.of(context).size.width * 0.40,
// //                   height: MediaQuery.of(context).size.height * 0.04,
// //                   child: FloatingActionButton.extended(
// //                       heroTag:"signin",
// //                       onPressed: (){
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => EnterApp()), ///////
// //                         );
// //                       },
// //                       label: Text('Login'),
// //                       backgroundColor: Color(0xffc4370b)
// //                   )
// //               ),
// //               new SizedBox(
// //                 height: (0.025 * MediaQuery.of(context).size.height),
// //               ),
// //               new SizedBox(
// //                   width: MediaQuery.of(context).size.width * 0.40,
// //                   height: MediaQuery.of(context).size.height * 0.04,
// //                   child: FloatingActionButton.extended(
// //                     heroTag: 'login',
// //                     onPressed: (){
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(builder: (context) => EnterApp()), //////////
// //                       );
// //                     },
// //                     label: Text('Create Account',),
// //                     backgroundColor: Color(0xffc4370b),
// //                   )
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       ),
// //     );
// //   }
// //}