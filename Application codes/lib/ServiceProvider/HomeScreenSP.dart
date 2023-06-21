///This is the code for home screen of service provider -- Which will have options to generate voucher that needs to be shared with the users
/// and View the history of previously generated vouchers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/CommonScreens/reusable_widget.dart';
import 'GenrateVouchers.dart';
import 'ViewHistory.dart';

class HomeScreenSP extends StatefulWidget {
  const HomeScreenSP({Key? key}) : super(key: key);

  @override
  State<HomeScreenSP> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreenSP> {
  // const TabPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBarOppLogOut(
          MediaQuery.of(context).size.width, "Home", context),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfffff5f5),
      body: SingleChildScrollView(
        child: Container(
          child: Row(
            children: [
              SizedBox(width: 0.05 * MediaQuery.of(context).size.width),
              // SizedBox(width: 0.125* MediaQuery.of(context).size.width),
              Column(
                children: [
                  SizedBox(height: 0.05 * MediaQuery.of(context).size.height),
                  SizedBox(
                      height: 0.2 * MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'Assets/Images/E Rupi icon.png',
                        height: 300,
                        width: 300,
                      )),
                  SizedBox(height: 0.05 * MediaQuery.of(context).size.height),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SPVouchers() // MyApp()
                          ));
                    },
                    child: reusableRowContainerBG(
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                        "GENERATE E-RUPI VOUCHER",
                        Icon(CupertinoIcons.plus_square_fill_on_square_fill,
                            size: 40, color: Color(0xfffff5f5))),
                  ),
                  SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewVouchers()));
                    },
                    child: reusableRowContainerBG(
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                        "VIEW HISTORY",
                        Icon(CupertinoIcons.arrow_right_square_fill,
                            size: 40, color: Color(0xfffff5f5))),
                  ),
                  SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
