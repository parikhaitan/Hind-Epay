import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/reusable_widget.dart';
import 'BankDetails.dart';
import 'CSVImport.dart';
import 'VoucherInfoDisha.dart';
import 'VoucherInfoSP.dart';

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
      appBar:
          reusableAppBarOpp(MediaQuery.of(context).size.width, "Home", context),
      resizeToAvoidBottomInset: true,
      backgroundColor:Color(0xfffff5f5),
      body: SingleChildScrollView(
        child: Container(
          child: Row(
            children: [
              SizedBox(width: 0.125 * MediaQuery.of(context).size.width),
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
                          builder: (context) => ErupiTransactionApp()// MyApp()
                      ));
                    },
                    child:  reusableRowContainerBG(
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                        "GENERATE E-RUPI VOUCHER",
                        Icon(CupertinoIcons.plus_square_fill_on_square_fill,
                            size: 40, color: Color(0xfffff5f5))),
                  ),
                  // SizedBox(
                  //   child: MaterialButton(
                  //       padding: EdgeInsets.all(4.0),
                  //       textColor: Colors.white,
                  //       splashColor: Colors.greenAccent,
                  //       elevation: 8.0,
                  //       child: reusableRowContainerBG(
                  //           MediaQuery.of(context).size.height,
                  //           MediaQuery.of(context).size.width,
                  //           "GENERATE E-RUPI VOUCHER",
                  //           Icon(CupertinoIcons.plus_square_fill_on_square_fill,
                  //               size: 40, color: Colors.white)),
                  //       // ),
                  //       onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => Upload()));
                  //
                  //         ///bank option page
                  //       }),
                  // ),
                  SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CsvImportScreen()));
                    },
                    child:   reusableRowContainerBG(
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                        "VIEW HISTORY",
                        Icon(CupertinoIcons.arrow_right_square_fill,
                            size: 40, color: Color(0xfffff5f5))),
                  ),
                  // SizedBox(
                  //   child: MaterialButton(
                  //       padding: EdgeInsets.all(4.0),
                  //       textColor: Colors.white,
                  //       splashColor: Colors.greenAccent,
                  //       elevation: 8.0,
                  //       child: reusableRowContainerBG(
                  //           MediaQuery.of(context).size.height,
                  //           MediaQuery.of(context).size.width,
                  //           "VIEW HISTORY",
                  //           Icon(CupertinoIcons.arrow_right_square_fill,
                  //               size: 40, color: Colors.white)),
                  //       // ),
                  //       onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => Upload()));
                  //
                  //         ///bank option page
                  //       }),
                  // ),
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
