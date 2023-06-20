import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/reusable_widget.dart';

import 'PayementScreen.dart';

class Upload extends StatelessWidget {
  static final String title = 'Bank Details';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.purple),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _serviceNameController = TextEditingController();
  TextEditingController _voucherAmountController = TextEditingController();
  TextEditingController _expirationDateController = TextEditingController();
  String selectedValue = "Black-White";
  int price = 2;
  bool isuploaded = false;
  final myController = TextEditingController();

  // late DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    // dbRef = FirebaseDatabase.instance.ref().child('Uploads');
  }

  @override
  Widget build(BuildContext context) {
    //final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      appBar: reusableAppBar(MediaQuery.of(context).size.width,"Generate Voucher", context ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfff16f00),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),

          //borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        // child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: (0.9 * MediaQuery.of(context).size.height),
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          width: 0.92 * MediaQuery.of(context).size.width,
                          height: 0.17 * MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepOrange,
                                blurRadius: 20,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Color(0xfffff5f5),
                          ),
                          child:Column(
                            children: [
                              SizedBox(height: 10),
                              Flexible(
                                child: Text(
                                    'Enter the service you would like to provide through the voucher: :   ',
                                    textAlign: TextAlign.center,
                                    // softWrap: false,
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(

                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color:  Color(0xfff16f00),
                                    )),
                              ),
                              SizedBox(height: 3),
                              Container(
                                width: 0.8* MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color(0xfffff5f5),
                                ),
                                child: TextField(
                                  controller: _serviceNameController,
                                  decoration: InputDecoration(
                                    hintText: "   Enter Service here..",
                                    border: InputBorder.none,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ), SizedBox(height: 13),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 0.45 * MediaQuery.of(context).size.width,
                              height: 0.17 * MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.deepOrange,
                                    blurRadius: 20,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Color(0xfffff5f5),
                              ),
                              child:Column(
                                children: [
                                  SizedBox(height: 8),
                                  Flexible(
                                    child: Text(
                                        'Date :   ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color:  Color(0xfff16f00),
                                        )
                                    ),
                                  ),
                                  Container(
                                    width: 0.37 * MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xfffff5f5),
                                    ),
                                    child: TextField(
                                      controller: _voucherAmountController,
                                      decoration: InputDecoration(

                                        border: InputBorder.none,

                                        hintText: "100",
                                      ),textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            Container(
                              width: 0.45 * MediaQuery.of(context).size.width,
                              height: 0.17 * MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xfffff5f5),
                              ),
                              child:Column(
                                children: [
                                  SizedBox(height: 8),
                                  Flexible(
                                    child: Text(
                                        'Enter amount per voucher :   ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xfff16f00),
                                        )),
                                  ),
                                  Container(
                                    width:0.37 * MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xfffff5f5),
                                    ),
                                    child: TextField(
                                      controller: _expirationDateController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "1/06/22",
                                      ),textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 0.92 * MediaQuery.of(context).size.width,
                          height: 0.25 * MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepOrange,
                                blurRadius: 20,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Color(0xfffff5f5),
                          ),
                          child:Column(
                            children: [
                              SizedBox(height: 10),
                              Flexible(
                                child: Text(
                                    'Update databse of recipients:  ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color:  Color(0xfff16f00),
                                    )),
                              ),
                              Container(
                                width: 0.9* MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:Color(0xfffff5f5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    FloatingActionButton.extended(

                      heroTag: "Done",
                       onPressed: () => {
                        //AwesomeDialog(
                      // context: context,
                      // dialogType: DialogType.success,
                      // animType: AnimType.bottomSlide,
                      // showCloseIcon: true,
                      // title: "Success",
                      // desc: "Voucher added successfully.",
                      // btnOkOnPress: () {
                      // Navigator.of(context, rootNavigator: true).pop();
                      // },
                      // )..show(),


                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  ErupiTransactionApp())), //
                      },
                      label: Text('Pay'),
                      //   icon: Icons.attach_file,
                      backgroundColor: Color(0xff20c215),
                      icon: Icon(Icons.payment),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}