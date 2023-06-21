///Generating e rupi vouchers -- the service provider can generate the vouchers for the user her wants to provide to from here

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hind_e_pay/CommonScreens/reusable_widget.dart';
import '../Backend/SPControllers.dart';
import 'BankDetails.dart';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'dart:io';
// class Voucher {
//   final String nameOfService;
//   final int numberOfVouchers;
//   final double amountPerVoucher;
//   final DateTime expirationDate;

//   Voucher({
//     required this.nameOfService,
//     required this.numberOfVouchers,
//     required this.amountPerVoucher,
//     required this.expirationDate,
//   });
// }

class SPVouchers extends StatefulWidget {
  @override
  _SPVouchersState createState() => _SPVouchersState();
}

class _SPVouchersState extends State<SPVouchers> {
  var nameOfService;
  var amountPerVoucher;
  var expirationDate;

  final controller = Get.put(SPController());
  static List<List<dynamic>> _data = [];
  String? filePath;
  String? data;
  var record;

  Widget _buildImportedDataList() {
    return Container(
      height: 100, // Specify a fixed height or any desired dimensions
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          final item = _data[index];
          return ListTile(
            title: Text(item.join(', ')),
          );
        },
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  List<List<dynamic>> vouchers = [];
  List<dynamic> voucher = [];

  // Creating the voucher
  void _createVoucher() {
    if (_formKey.currentState!.validate()) {
      final nameOfService = controller.serviceController.text.trim();
      final amountPerVoucher =
          double.parse(controller.amountController.text.trim());
      final expirationDate = selectedDate;

      voucher.add(nameOfService);
      voucher.add(amountPerVoucher);
      voucher.add(expirationDate);

      print(voucher);
      controller.serviceController.clear();
      controller.amountController.clear();
    }
    vouchers.add(voucher);
  }


  //generating unique code for users to act as the voucher code -- this has to be ideally provided by the banks but here we are stimulating the environment since the E Rupi API is not available
  String generateRandomCode() {
    final random = Random();
    final letters =
        List.generate(4, (_) => String.fromCharCode(random.nextInt(26) + 65));
    final numbers = List.generate(2, (_) => random.nextInt(10).toString());

    final codeList = [...letters, ...numbers]..shuffle(random);

    return codeList.join('');
  }

  //Selecting the data of the recipients
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void _pickFile() async {
      final result = await FilePicker.platform.pickFiles(allowMultiple: false);

      // if no file is picked
      if (result == null) return;
      // we will log the name, size and path of the
      // first picked file (if multiple are selected)
      print(result.files.first.name);
      filePath = result.files.first.path!;

      final input = File(filePath!).openRead();
      final fields = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();
      print(fields);

      setState(() {
        _data = fields;
      });
    }

    //Exporting the data of voucher informations to firebase -- this has to be shared with the bank when E Rupi ApI will be available
    Future<void> export_data() async {
      final CollectionReference maindb =
          FirebaseFirestore.instance.collection('Vouchers');
      print(_data.length);
      for (var i = 0; i < _data.length; i++) {
        record = {
          "Code": generateRandomCode(),
          "Amount": voucher[1],
          "Service": voucher[0],
          "Expiration Date": voucher[2],
          "Nid": _data[i][0],
        };
        maindb.add(record);
        print(record);
      }
    }

    Future<String?> check() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                title: Text(
                  'Confirm vouchers generation for file ${filePath}?',
                  style: TextStyle(fontSize: 20),
                ),
                actions: [
                  TextButton(
                    child: Text("YES, generate vouchers."),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentConfirmationPage(
                            totalvouchers: vouchers,
                            totalAmount: _calculateTotalAmount(),
                          ),
                        ),
                      );
                      export_data();
                    },
                  ),
                  TextButton(
                    child: Text("NO, go back."),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]));

    return Scaffold(
      appBar: reusableAppBarOpp(
          MediaQuery.of(context).size.width, 'E-Rupi Transaction App', context),
      // AppBar(
      //   title: Text('E-Rupi Transaction App'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReusableTextFieldWithTitleForm(
                  context,
                  "Purpose of voucher",
                  TextFormField(
                    controller: controller.serviceController,
                    decoration: InputDecoration(labelText: 'Eg: Scholarship'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the name of the service';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                ReusableTextFieldWithTitleForm(
                  context,
                  "Amount per Voucher",
                  TextFormField(
                    controller: controller.amountController,
                    decoration: InputDecoration(labelText: '100'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the amount per voucher';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Invalid amount';
                      }
                      return null;
                    },
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  height: 0.1 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Assets/Images/bg screen.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      Flexible(
                        child: Text("Expiration Date: ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfffff5f5),
                            )),
                      ),
                      Container(
                        width: 0.8 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          //color: Color(0xfffff5f5),
                        ),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.calendar,
                                size: 40, color: Color(0xfffff5f5)),
                            SizedBox(
                              width: 0.05 * MediaQuery.of(context).size.width,
                            ),
                            TextButton(
                              onPressed: () => _selectDate(context),
                              child: Text(
                                '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                                style: TextStyle(
                                  color: Colors.cyanAccent,
                                  fontSize: 22,
                                  fontFamily: "Montserrat",
                                  // fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    _pickFile();
                  },
                  child: reusableRowContainerBG(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width,
                    "Choose CSV File",
                    Icon(CupertinoIcons.paperclip,
                        size: 40, color: Color(0xfffff5f5)),
                  ),
                ),
                SizedBox(height: 10.0),
                const Text(
                  'Imported Data sample:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _data.isNotEmpty
                    ? _buildImportedDataList()
                    : const Text('No data imported'),
                SizedBox(height: 10.0),
                FloatingActionButton.extended(
                  heroTag: "Done",
                  onPressed: () {
                    _createVoucher();
                    check();
                  },
                  label: Text('Generate Vouchers'),
                  //   icon: Icons.attach_file,
                  backgroundColor: Color(0xff20c215),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  ///Reciept screen

  //Calculating the money based on number of vouchers and price per voucher
  double _calculateTotalAmount() {
    double totalAmount = 0;
    for (var voucher in vouchers) {
      totalAmount += _data.length * voucher[1];
    }
    return totalAmount;
  }
}

class PaymentConfirmationPage extends StatelessWidget {
  final List<dynamic> totalvouchers;
  final double totalAmount;

  const PaymentConfirmationPage({
    required this.totalvouchers,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBarOpp(
          MediaQuery.of(context).size.height, 'Payment Confirmation', context),
      // AppBar(
      //   title: Text('Payment Confirmation'),
      // ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Voucher Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: totalvouchers.length,
                itemBuilder: (context, index) {
                  final voucher = totalvouchers[index];
                  return ListTile(
                    title: Text(voucher[0]),
                    subtitle: Text(
                      'Amount: ${voucher[1]}, Expiration: ${voucher[2]}',
                    ),
                  );
                },
              ),
            ),
            Text(
              "Recipient contacts",
            ),
            Expanded(
              // height: 100, // Specify a fixed height or any desired dimensions
              child: ListView.builder(
                itemCount: _SPVouchersState._data.length,
                itemBuilder: (context, index) {
                  final item = _SPVouchersState._data[index];
                  return ListTile(
                    title: Text(item.join(', ')),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Amount: $totalAmount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            FloatingActionButton.extended(
              heroTag: "Done",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ErupiTransactionForm()));
              },
              label: Text('Pay'),
              //   icon: Icons.attach_file,
              backgroundColor: Color(0xff20c215),
            ),
          ],
        ),
      ),
    );
  }
}
