// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class Voucher {
//   final String nameOfService;
//   final int numberOfVouchers;
//   final double amountPerVoucher;
//   final DateTime expirationDate;
//
//   Voucher({
//     required this.nameOfService,
//     required this.numberOfVouchers,
//     required this.amountPerVoucher,
//     required this.expirationDate,
//   });
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'E-Rupi Transaction App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _serviceController = TextEditingController();
//   final TextEditingController _voucherController = TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   DateTime _selectedDate = DateTime.now();
//
//   List<Voucher> _vouchers = [];
//
//   void _createVoucher() {
//     if (_formKey.currentState!.validate()) {
//       final newVoucher = Voucher(
//         nameOfService: _serviceController.text,
//         numberOfVouchers: int.parse(_voucherController.text),
//         amountPerVoucher: double.parse(_amountController.text),
//         expirationDate: _selectedDate,
//       );
//
//       setState(() {
//         _vouchers.add(newVoucher);
//       });
//
//       _serviceController.clear();
//       _voucherController.clear();
//       _amountController.clear();
//     }
//   }
//
//   void _deleteVoucher(int index) {
//     setState(() {
//       _vouchers.removeAt(index);
//     });
//   }
//
//   void _payNow() {
//     double totalAmount = 0;
//     for (var voucher in _vouchers) {
//       totalAmount += voucher.numberOfVouchers * voucher.amountPerVoucher;
//     }
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Payment Confirmation'),
//           content: Text('You have to pay $totalAmount amount.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );
//
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('E-Rupi Transaction App'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   controller: _serviceController,
//                   decoration: InputDecoration(labelText: 'Purpose of voucher'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter the name of the service';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _voucherController,
//                   decoration: InputDecoration(labelText: 'Number of Vouchers'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter the number of vouchers';
//                     }
//                     if (int.tryParse(value) == null) {
//                       return 'Invalid number';
//                     }
//                     return null;
//                   },
//                   keyboardType: TextInputType.number,
//                   inputFormatters: <TextInputFormatter>[
//                     FilteringTextInputFormatter.digitsOnly
//                   ],
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _amountController,
//                   decoration: InputDecoration(labelText: 'Amount per Voucher'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter the amount per voucher';
//                     }
//                     if (double.tryParse(value) == null) {
//                       return 'Invalid amount';
//                     }
//                     return null;
//                   },
//                   keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 ),
//                 SizedBox(height: 16.0),
//                 Row(
//                   children: [
//                     Text('Expiration Date: '),
//                     TextButton(
//                       onPressed: () => _selectDate(context),
//                       child: Text(
//                         '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: _createVoucher,
//                   child: Text('Create Voucher'),
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PaymentConfirmationPage(
//                           vouchers: _vouchers,
//                           totalAmount: _calculateTotalAmount(),
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text('Pay Now'),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text('Vouchers:'),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: _vouchers
//                       .asMap()
//                       .entries
//                       .map(
//                         (entry) => ListTile(
//                       title: Text(entry.value.nameOfService),
//                       subtitle: Text(
//                         'Vouchers: ${entry.value.numberOfVouchers}, Amount: ${entry.value.amountPerVoucher}, Expiration: ${entry.value.expirationDate}',
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () => _deleteVoucher(entry.key),
//                       ),
//                     ),
//                   )
//                       .toList(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   double _calculateTotalAmount() {
//     double totalAmount = 0;
//     for (var voucher in _vouchers) {
//       totalAmount += voucher.numberOfVouchers * voucher.amountPerVoucher;
//     }
//     return totalAmount;
//   }
// }
//
// class PaymentConfirmationPage extends StatelessWidget {
//   final List<Voucher> vouchers;
//   final double totalAmount;
//
//   const PaymentConfirmationPage({
//     required this.vouchers,
//     required this.totalAmount,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Confirmation'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Voucher Details:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: vouchers.length,
//                 itemBuilder: (context, index) {
//                   final voucher = vouchers[index];
//                   return ListTile(
//                     title: Text(voucher.nameOfService),
//                     subtitle: Text(
//                       'Vouchers: ${voucher.numberOfVouchers}, Amount: ${voucher.amountPerVoucher}, Expiration: ${voucher.expirationDate}',
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Total Amount: $totalAmount',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Perform payment logic
//               },
//               child: Text('Pay'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hind_e_pay/CSVImport.dart';
import 'package:hind_e_pay/SelectBankSP.dart';
import 'Backend/SPControllers.dart';
import 'BankDetails.dart';
import 'reusable_widget.dart';
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
  List<List<dynamic>> _data = [];
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

  void _deleteVoucher(int index) {
    setState(() {
      vouchers.removeAt(index);
    });
  }

  String generateRandomCode() {
    final random = Random();
    final letters =
    List.generate(4, (_) => String.fromCharCode(random.nextInt(26) + 65));
    final numbers = List.generate(2, (_) => random.nextInt(10).toString());

    final codeList = [...letters, ...numbers]..shuffle(random);

    return codeList.join('');
  }

  void _payNow() {
    double totalAmount = 0;
    for (var voucher in vouchers) {
      totalAmount += _data.length * voucher[1];
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Text('You have to pay $totalAmount amount.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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

    // Future<void> _pickFile() async {
    //   // FilePickerResult? result;
    //   // final filePicker =  File_Picker_Desktop();
    //   // result = await filePicker.openFile();
    //   final result = await FilePicker.platform.pickFiles(allowMultiple:false);
    //   // final result = await FilePicker.platform.pickFiles(
    //   //   type: FileType.custom,
    //   //   allowedExtensions: ['csv'],
    //   // );
    //   if (result != null && result.files.isNotEmpty) {
    //     try{
    //       setState(() {
    //         final fileBytes = result.files.first.bytes;
    //         //data = String.fromCharCodes(
    //        // var s = fileBytes;
    //         var data =  String.fromCharCodes(fileBytes!); // Safe
    //         _data = CsvToListConverter().convert(data, eol: '\n');
    //         filePath = result.files.first.name;
    //         // if (s != null) {
    //         //
    //         // }
    //         //    fileBytes!);
    //
    //       });
    //     }
    //     catch (e){
    //       print('Error picking file$e');
    //     }
    //   }
    // }

    void export_data() async {
      final CollectionReference maindb =
      FirebaseFirestore.instance.collection('Vouchers');
      print( _data.length);
      for (var i = 0; i < _data.length; i++) {
        record = {
          "Code": generateRandomCode(),
          "Amount": voucher[1],
          "Service": voucher[0],
          "Expiration Date": voucher[2],
          "Nid": _data[i][4],
        };
         maindb.add(record);
        print(record);
      }
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        showCloseIcon: true,
        title: "Success",
        desc: "Vouchers have been generated!",
        btnOkOnPress: () {},
      )..show();
      print("Data added.");
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
      appBar: AppBar(
        title: Text('E-Rupi Transaction App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.serviceController,
                  decoration: InputDecoration(labelText: 'Purpose of voucher'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the name of the service';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.amountController,
                  decoration: InputDecoration(labelText: 'Amount per Voucher'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the amount per voucher';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Invalid amount';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Expiration Date: '),
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: Text(
                        '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    _pickFile();
                  },
                  child: Text("Choose CSV file"),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    _createVoucher();
                    check();
                  },
                  child: Text("Generate Vouchers"),
                ),
                const SizedBox(height: 10),
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentConfirmationPage(
                          totalvouchers: vouchers,
                          totalAmount: _calculateTotalAmount(),
                        ),
                      ),
                    );
                  },
                  child: Text('Pay Now'),
                ),
                // SizedBox(height: 16.0),
                // Text('Vouchers:'),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: _vouchers
                //       .asMap()
                //       .entries
                //       .map(
                //         (entry) => ListTile(
                //           title: Text(entry.value.nameOfService),
                //           subtitle: Text(
                //             'Vouchers: ${entry.value.numberOfVouchers}, Amount: ${entry.value.amountPerVoucher}, Expiration: ${entry.value.expirationDate}',
                //           ),
                //           trailing: IconButton(
                //             icon: Icon(Icons.delete),
                //             onPressed: () => _deleteVoucher(entry.key),
                //           ),
                //         ),
                //       )
                //       .toList(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
      appBar: AppBar(
        title: Text('Payment Confirmation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 16.0),
            Text(
              'Total Amount: $totalAmount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => ErupiTransactionApp()));
    },
                // Perform payment logic

              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}