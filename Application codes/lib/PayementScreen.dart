// import 'package:flutter/material.dart';
// import 'package:hind_e_pay/reusable_widget.dart';
//
// import 'BankDetails.dart';
//
// class PayementScreen extends StatelessWidget {
//   static final String title = 'Bank Details';
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: title,
//     home: MainPage(),
//   );
// }
//
// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   TextEditingController _orgNameController = TextEditingController();
//   TextEditingController _AccNumController = TextEditingController();
//   TextEditingController _IFSCCodeController = TextEditingController();
//   TextEditingController _GSTINController = TextEditingController();
//   String selectedValue = "HDFC";
//   int price = 2;
//   bool isuploaded = false;
//   final myController = TextEditingController();
//
//   // late DatabaseReference dbRef;
//   @override
//   void initState() {
//     super.initState();
//     // dbRef = FirebaseDatabase.instance.ref().child('Uploads');
//   }
//
//   List<DropdownMenuItem<String>> get dropdownItems {
//     List<DropdownMenuItem<String>> menuItems = [
//       DropdownMenuItem(child: Text("HDFC"), value: "HDFC"),
//       DropdownMenuItem(child: Text("SBI"), value: "SBI"),
//     ];
//     return menuItems;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //final fileName = file != null ? basename(file!.path) : 'No File Selected';
//
//     return Scaffold(
//        appBar: reusableAppBarOpp(MediaQuery.of(context).size.width, "Bank Details", context),
//       backgroundColor: Color(0xfffff5f5),
//       body: Container(
//         alignment: Alignment.topCenter,
//     // child: SingleChildScrollView(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: (0.8 * MediaQuery.of(context).size.height),
//             alignment: Alignment.topCenter,
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       Column(
//                         children: [
//                           SizedBox(height: 0.02 * MediaQuery.of(context).size.height,),
//                           Container(
//                             width: 0.9 * MediaQuery.of(context).size.width,
//                             height: 0.1 * MediaQuery.of(context).size.height,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color(0x3f000000),
//                                   blurRadius: 10,
//                                   offset: Offset(0, 4),
//                                 ),
//                               ],
//                               // color: Colors.orangeAccent,
//                             ),
//                             child:Row(
//                               children: [
//                                 SizedBox(height: 10),
//                                 SizedBox(width: 10),
//                                 Icon(Icons.account_balance_sharp, size: 45,color: Color(0xfffff5f5)),
//                                 SizedBox(width: 10),
//                                // image: ,
//                                 Flexible(
//                                   child: Text(
//                                       'Select bank :   ',
//                                       textAlign: TextAlign.start,
//                                       // softWrap: false,
//                                       // overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//
//                                         fontSize: 18.0,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xfffff5f5),
//                                       )),
//                                 ),
//                                 SizedBox(width: 3),
//                                 new DropdownButton(
//                                     value: selectedValue,
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         selectedValue = newValue!;
//                                       });
//                                       ///backend
//                                       if (selectedValue == 'Coloured') {
//                                         price = 5;
//                                       }
//                                       else {
//                                         price = 2;
//                                       }
//                                     },
//                                     items: dropdownItems
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ), SizedBox(height: 13),
//                       Column(
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 width: 0.9 * MediaQuery.of(context).size.width,
//                                 height: 0.55 * MediaQuery.of(context).size.height,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(0x3f000000),
//                                       blurRadius: 10,
//                                       offset: Offset(0, 4),
//                                     ),
//                                   ],
//                                   //color: Colors.orangeAccent,
//                                 ),
//                                 child:Column(
//                                   children: [
//                                     SizedBox(height: 8),
//                                     Flexible(
//                                       child: Text(
//                                           'ENTER BANK DETAILS  ',
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             fontSize: 22.0,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color(0xfffff5f5),
//                                           )
//                                       ),
//                                     ),
//                                     Flexible(
//                                       child: Text(
//                                           'Organisation Name   ',
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color(0xfffff5f5),
//                                           )
//                                       ),
//                                     ),
//                                     Container(
//                                       width: 0.8 * MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         color:Color(0xfffff5f5),
//                                       ),
//                                       child: TextField(
//                                         controller: _orgNameController,
//                                         decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                            // hintText: "100",
//                                         ),textAlign: TextAlign.left,
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Flexible(
//                                       child: Text(
//                                           'Account number   ',
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color(0xfffff5f5),
//                                           )
//                                       ),
//                                     ),
//                                     Container(
//                                       width: 0.8 * MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Color(0xfffff5f5),
//                                       ),
//                                       child: TextField(
//                                         controller: _AccNumController,
//                                         decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                          // hintText: "100",
//                                         ),textAlign: TextAlign.left,
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Flexible(
//                                       child: Text(
//                                           'IFSC Code   ',
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold,
//                                             color:Color(0xfffff5f5),
//                                           )
//                                       ),
//                                     ),
//                                     Container(
//                                       width: 0.8 * MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Color(0xfffff5f5),
//                                       ),
//                                       child: TextField(
//                                         controller: _IFSCCodeController,
//                                         decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                         //  hintText: "100",
//                                         ),textAlign: TextAlign.left,
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Flexible(
//                                       child: Text(
//                                           'GSTIN   ',
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color(0xfffff5f5),
//                                           )
//                                       ),
//                                     ),
//                                     Container(
//                                       width: 0.8 * MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Color(0xfffff5f5),
//                                       ),
//                                       child: TextField(
//                                         controller: _GSTINController,
//                                         decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                           //hintText: "100",
//                                         ),textAlign: TextAlign.left,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                       FloatingActionButton.extended(
//                           heroTag: "Done",
//                           onPressed: () => {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) =>  ErupiTransactionForm())),
//                           },
//                           label: Text('Confirm Details'),
//                           backgroundColor: Color(0xff20c215),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               ],
//             ),
//           ),
//        // ),
//       ),
//        ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ErupiTransactionApp());
}

class ErupiTransactionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Rupi Transaction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ErupiTransactionForm(),
    );
  }
}

class ErupiTransactionForm extends StatefulWidget {
  @override
  _ErupiTransactionFormState createState() => _ErupiTransactionFormState();
}

class _ErupiTransactionFormState extends State<ErupiTransactionForm> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedBank;
  String? _selectedBranch;
  String? _organisationName;
  String? _accountNumber;
  String? _ifscCode;
  String? _gstinNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('e-Rupi Transaction Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: _selectedBank,
                onChanged: (value) {
                  setState(() {
                    _selectedBank = value;
                  });
                },
                items: <String>[
                  'State Bank Of India',
                  'Bank of Baroda',
                  'Canara Bank',
                  'HDFC Bank',
                  'ICICI Bank',
                  'Indian Bank',
                  'Induslnd Bank',
                  'Kotak Mahindra Bank',
                  'Punjab National Bank',
                  'Unioun Bank of India',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Bank',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a bank';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedBranch,
                onChanged: (value) {
                  setState(() {
                    _selectedBranch = value;
                  });
                },
                items: <String>[
                  'Branch A',
                  'Branch B',
                  'Branch C',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Branch',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a Branch';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _organisationName = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Organization Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the organization name';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _accountNumber = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Account number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the account number';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   onChanged: (value) {
              //     setState(() {
              //       _gstinNumber = value;
              //     });
              //   },
              //   decoration: InputDecoration(
              //     labelText: 'GST number',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter the GST number';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _ifscCode = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'IFSC number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the IFSC number';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    // Check if the account number exists in the database
                    checkAccountNumberExistence();
                  }
                },
                child: Text('Confirm Bank Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkAccountNumberExistence() async {
    try {
      final CollectionReference accounts =
      FirebaseFirestore.instance.collection('accounts');

      final QuerySnapshot snapshot = await accounts
          .where('accountNumber', isEqualTo: _accountNumber)
          .get();

      if (snapshot.docs.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceiptPage(
              bank: _selectedBank!,
              branch: _selectedBranch!,
              organization: _organisationName!,
              accountNumber: _accountNumber!,
              // gstinNumber: _gstinNumber!,
              ifscCode: _ifscCode!,
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Account Existence'),
              content: Text('The account number does not exist.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }

      // Reset the form
      if (_formKey.currentState != null) {
        _formKey.currentState!.reset();
      }
    } catch (e) {
      print('Error checking account existence: $e');
    }
  }
}

class ReceiptPage extends StatelessWidget {
  final String bank;
  final String branch;
  final String organization;
  final String accountNumber;
  // final String gstinNumber;
  final String ifscCode;

  const ReceiptPage({
    required this.bank,
    required this.branch,
    required this.organization,
    required this.accountNumber,
    // required this.gstinNumber,
    required this.ifscCode,
  });

  void confirmPayment(BuildContext context) {
    // Perform payment confirmation logic
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Text('Payment confirmed. Thank you for your payment.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void cancelPayment(BuildContext context) {
    // Cancel payment logic
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Cancellation'),
          content: Text('Payment canceled.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Receipt Details',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Account Number: $accountNumber',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Bank: $bank',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Branch: $branch',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Organization: $organization',
              style: TextStyle(fontSize: 18),
            ),
            // Text(
            //   'GST Number: $gstinNumber',
            //   style: TextStyle(fontSize: 18),
            // ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => confirmPayment(context),
                  child: Text('Confirm Payment'),
                ),
                ElevatedButton(
                  onPressed: () => cancelPayment(context),
                  child: Text('Cancel Payment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}