import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hind_e_pay/viewVoucher.dart';
import 'package:flutter/cupertino.dart';
import 'reusable_widget.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ERupiHome(),
    );
  }
}

class ERupiHome extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<ERupiHome> {
  final TextEditingController _nameController = TextEditingController();
  String name = '';
  var record;

  @override
  Widget build(BuildContext context) {
    void export_data() async {
      final CollectionReference csv_data =
          FirebaseFirestore.instance.collection('Vouchers');
      final my_data = await rootBundle.loadString("Assets/data.csv");
      List<List<dynamic>> csvTable =
          CsvToListConverter().convert(my_data, eol: '\n');

      List<List<dynamic>> data = [];
      data = csvTable;

      for (var i = 0; i < data.length; i++) {
        record = {
          "Code": data[i][0],
          "Amount": data[i][1],
          "Service": data[i][2],
          "Expiration Date": data[i][3],
          "Nid": data[i][4],
        };
        csv_data.add(record);
      }
      print("Data added.");
    }

    ;

    Future<void> _addVoucher() async {
      final name = _nameController.text.trim();
      if (name.isNotEmpty) {
        try {
          CollectionReference users =
              FirebaseFirestore.instance.collection('User Vouchers');

          // Check if the voucher already exists in User Vouchers collection
          bool voucherExists = false;
          QuerySnapshot existingVouchers =
              await users.where('Code', isEqualTo: name).limit(1).get();
          if (existingVouchers.docs.isNotEmpty) {
            voucherExists = true;
          }

          if (!voucherExists) {
            // Voucher doesn't exist in User Vouchers collection, add it
            QuerySnapshot snapshot = await FirebaseFirestore.instance
                .collection('Vouchers')
                .where('Code', isEqualTo: name)
                .get();
            if (snapshot.docs.isNotEmpty) {
              snapshot.docs.forEach((doc) async {
                await users.add({
                  'Code': doc['Code'],
                  'Amount': doc['Amount'],
                  'Expiration Date': doc['Expiration Date'],
                  'Service': doc['Service'],
                  'Nid': doc['Nid'],
                });
              });
              print('Data added');
              print('SUccess');
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

    Future<void> _viewVoucher() async {
      try {
        QuerySnapshot snapshot =
            await FirebaseFirestore.instance.collection('User Vouchers').get();
        snapshot.docs.forEach((doc) {
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
        "E RUPI",
        context,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfffff5f5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Row(
            children: [
              SizedBox(width: 0.125 * MediaQuery.of(context).size.width),
              Column(
                children: [
                  SizedBox(height: 0.07 * MediaQuery.of(context).size.height),
                  SizedBox(
                      height: 0.2 * MediaQuery.of(context).size.height,
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
                          size: 40, color:Color(0xfffff5f5)),
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
                            size: 40, color: Color(0xfffff5f5))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    @override
    void dispose() {
      _nameController.dispose();
      super.dispose();
    }
  }
}
