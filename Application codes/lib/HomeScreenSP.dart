import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/reusable_widget.dart';
import 'VoucherInfoSP.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
 // const TabPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBarOpp(MediaQuery.of(context).size.width, "Home", context),
      resizeToAvoidBottomInset: true,

      backgroundColor: Colors.white,
      body:
      Container(


        child: Row(
          children: [
           // SizedBox(width: 0.125* MediaQuery.of(context).size.width),
            Column(
              children:[
                SizedBox(height: 0.07* MediaQuery.of(context).size.height),
                Image.asset(
                  "Assets/Images/E Rupi icon.png",
                  alignment: Alignment.center,
                ),
                SizedBox(height: 0.05* MediaQuery.of(context).size.height),
                SizedBox(
                  child: MaterialButton(
                    padding: EdgeInsets.all(4.0),
                    textColor: Colors.white,
                    splashColor: Colors.greenAccent,
                    elevation: 8.0,
                    child: reusableRowContainerBG(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, "GENERATE E-RUPI VOUCHER", Icon(
                        CupertinoIcons.plus_square_fill_on_square_fill,
                        size: 40,
                        color: Colors.white)),
                    // ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  Upload())); ///bank option page
                      }
                  ),
                ),
                SizedBox(height: 0.03* MediaQuery.of(context).size.height),

                SizedBox(
                  child: MaterialButton(
                      padding: EdgeInsets.all(4.0),
                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: reusableRowContainerBG(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width,
                          "VIEW HISTORY", Icon(
                              CupertinoIcons.arrow_right_square_fill,
                              size: 40,
                              color: Colors.white)),
                      // ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  Upload())); ///bank option page
                      }
                  ),
                ),

                SizedBox(height: 0.03* MediaQuery.of(context).size.height),



              ],
            ),
          ],
        ),
      ),
      // backgroundColor: Color(0xfff16f00),
      // body: SizedBox(
      //   width: double.infinity,
      //
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       SizedBox(
      //         height: 0.05 * MediaQuery.of(context).size.height,
      //       ),
      //       SizedBox(
      //         height: 0.12 * MediaQuery.of(context).size.height,
      //         width: 0.8 * MediaQuery.of(context).size.width,
      //
      //         child : ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //               primary: Color(0xfffff5f5),
      //
      //               ),
      //           onPressed: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) =>  Upload())); ///bank option page
      //           },
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               Container(
      //                 width: MediaQuery.of(context).size.width * 0.25,
      //                 height: MediaQuery.of(context).size.height *0.15,
      //                 child: Image.asset(
      //                   'Assets/Images/GenerateVoucher.png',
      //                 ),
      //               ),
      //               Text(
      //                 "Generate e-Rupi \nvoucher",
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 22,
      //                   fontFamily: "Montserrat",
      //                   fontWeight: FontWeight.w700,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           // const Text('Add Vouchers',
      //           //   style : TextStyle(
      //           //       fontSize: 20,
      //           //       color: Color(0xfff16f00),
      //           //       fontWeight: FontWeight.w600),)
      //         ),
      //       ),
      //       SizedBox(
      //         height: 0.05 * MediaQuery.of(context).size.height,
      //       ),
      //       SizedBox(
      //         height: 0.12 * MediaQuery.of(context).size.height,
      //         width: 0.8 * MediaQuery.of(context).size.width,
      //
      //         child : ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             primary: Color(0xfffff5f5),
      //
      //           ),
      //           onPressed: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) =>  Upload())); ///bank option page
      //           },
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               Container(
      //                 width: MediaQuery.of(context).size.width * 0.25,
      //                 height: MediaQuery.of(context).size.height *0.15,
      //                 child: Image.asset(
      //                   'Assets/Images/history.jpeg',
      //                 ),
      //               ),
      //               Text(
      //                 "View History",
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 22,
      //                   fontFamily: "Montserrat",
      //                   fontWeight: FontWeight.w700,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           // const Text('Add Vouchers',
      //           //   style : TextStyle(
      //           //       fontSize: 20,
      //           //       color: Color(0xfff16f00),
      //           //       fontWeight: FontWeight.w600),)
      //         ),
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }
}
