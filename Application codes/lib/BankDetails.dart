// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(ErupiTransactionApp());
// }
//
// class ErupiTransactionApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'e-Rupi Transaction App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ErupiTransactionForm(),
//     );
//   }
// }
//
// class ErupiTransactionForm extends StatefulWidget {
//   @override
//   _ErupiTransactionFormState createState() => _ErupiTransactionFormState();
// }
//
// class _ErupiTransactionFormState extends State<ErupiTransactionForm> {
//   final _formKey = GlobalKey<FormState>();
//
//   String? _selectedBank;
//   String? _selectedBranch;
//   String? _organisationName;
//   String? _accountNumber;
//   String? _ifscCode;
//   String? _gstinNumber;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('e-Rupi Transaction Form'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               DropdownButtonFormField<String>(
//                 value: _selectedBank,
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedBank = value;
//                   });
//                 },
//                 items: <String>[
//                   'State Bank Of India',
//                   'Bank of Baroda',
//                   'Canara Bank',
//                   'HDFC Bank',
//                   'ICICI Bank',
//                   'Indian Bank',
//                   'Induslnd Bank',
//                   'Kotak Mahindra Bank',
//                   'Punjab National Bank',
//                   'Unioun Bank of India',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Select Bank',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a bank';
//                   }
//                   return null;
//                 },
//               ),
//               DropdownButtonFormField<String>(
//                 value: _selectedBranch,
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedBranch = value;
//                   });
//                 },
//                 items: <String>[
//                   'Branch A',
//                   'Branch B',
//                   'Branch C',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Select Branch',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a Branch';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     _organisationName = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Organization Name',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the organization name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     _accountNumber = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Account number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the account number';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     _gstinNumber = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'GST number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the GST number';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     _ifscCode = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'IFSC number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the IFSC number';
//                   }
//                   return null;
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState != null &&
//                       _formKey.currentState!.validate()) {
//                     // Check if the account number exists in the database
//                     checkAccountNumberExistence();
//                   }
//                 },
//                 child: Text('Confirm Bank Details'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> checkAccountNumberExistence() async {
//     try {
//       final CollectionReference accounts =
//       FirebaseFirestore.instance.collection('accounts');
//
//       final QuerySnapshot snapshot = await accounts
//           .where('accountNumber', isEqualTo: _accountNumber)
//           .get();
//
//       if (snapshot.docs.isNotEmpty) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ReceiptPage()),
//         );
//       } else {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Account Existence'),
//               content: Text('The account number does not exist.'),
//               actions: [
//                 TextButton(
//                   child: Text('OK'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       }
//
//       // Reset the form
//       if (_formKey.currentState != null) {
//         _formKey.currentState!.reset();
//       }
//     } catch (e) {
//       print('Error checking account existence: $e');
//     }
//   }
// }
//
// class ReceiptPage extends StatelessWidget {
//   void confirmPayment(BuildContext context) {
//     // Perform payment confirmation logic
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Payment Confirmation'),
//           content: Text('Payment confirmed. Thank you for your payment.'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void cancelPayment(BuildContext context) {
//     // Cancel payment logic
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Payment Cancellation'),
//           content: Text('Payment canceled.'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Receipt'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Receipt Details',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Account Number: xxxxxxxx',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Bank: State Bank of India',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Branch: Branch A',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Organization: ABC Company',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'GST Number: xxxxxxxx',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 32),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => confirmPayment(context),
//                   child: Text('Confirm Payment'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => cancelPayment(context),
//                   child: Text('Cancel Payment'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(ErupiTransactionApp());
// }
//
// class ErupiTransactionApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'e-Rupi Transaction App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ErupiTransactionForm(),
//     );
//   }
// }
//
// class ErupiTransactionForm extends StatefulWidget {
//   @override
//   _ErupiTransactionFormState createState() => _ErupiTransactionFormState();
// }
//
// class _ErupiTransactionFormState extends State<ErupiTransactionForm> {
//   final _formKey = GlobalKey<FormState>();
//
//   String? _selectedBank;
//   String? _selectedBranch;
//   String? _organisationName;
//   String? _accountNumber;
//   String? _ifscCode;
//   String? _gstinNumber;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('e-Rupi Transaction Form'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               DropdownButtonFormField<String>(
//                 value: _selectedBank,
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedBank = value;
//                   });
//                 },
//                 items: <String>[
//                   'State Bank Of India',
//                   'Bank of Baroda',
//                   'Canara Bank',
//                   'HDFC Bank',
//                   'ICICI Bank',
//                   'Indian Bank',
//                   'Induslnd Bank',
//                   'Kotak Mahindra Bank',
//                   'Punjab National Bank',
//                   'Unioun Bank of India',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Select Bank',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a bank';
//                   }
//                   return null;
//                 },
//               ),
//               DropdownButtonFormField<String>(
//                 value: _selectedBranch,
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedBranch = value;
//                   });
//                 },
//                 items: <String>[
//                   'Branch A',
//                   'Branch B',
//                   'Branch C',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Select Branch',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a Branch';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     _organisationName = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Organization Name',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the organization name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     _accountNumber = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Account number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the account number';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     _gstinNumber = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'GST number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the GST number';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     _ifscCode = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'IFSC number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the IFSC number';
//                   }
//                   return null;
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState != null &&
//                       _formKey.currentState!.validate()) {
//                     // Check if the account number exists in the database
//                     checkAccountNumberExistence();
//                   }
//                 },
//                 child: Text('Confirm Bank Details'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> checkAccountNumberExistence() async {
//     try {
//       final CollectionReference accounts =
//       FirebaseFirestore.instance.collection('accounts');
//
//       final QuerySnapshot snapshot = await accounts
//           .where('accountNumber', isEqualTo: _accountNumber)
//           .get();
//
//       if (snapshot.docs.isNotEmpty) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ReceiptPage(
//               bank: _selectedBank!,
//               branch: _selectedBranch!,
//               organization: _organisationName!,
//               accountNumber: _accountNumber!,
//               gstinNumber: _gstinNumber!,
//               ifscCode: _ifscCode!,
//             ),
//           ),
//         );
//       } else {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Account Existence'),
//               content: Text('The account number does not exist.'),
//               actions: [
//                 TextButton(
//                   child: Text('OK'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       }
//
//       // Reset the form
//       if (_formKey.currentState != null) {
//         _formKey.currentState!.reset();
//       }
//     } catch (e) {
//       print('Error checking account existence: $e');
//     }
//   }
// }
//
// class ReceiptPage extends StatelessWidget {
//   final String bank;
//   final String branch;
//   final String organization;
//   final String accountNumber;
//   final String gstinNumber;
//   final String ifscCode;
//
//   const ReceiptPage({
//     required this.bank,
//     required this.branch,
//     required this.organization,
//     required this.accountNumber,
//     required this.gstinNumber,
//     required this.ifscCode,
//   });
//
//   void confirmPayment(BuildContext context) {
//     // Perform payment confirmation logic
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Payment Confirmation'),
//           content: Text('Payment confirmed. Thank you for your payment.'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void cancelPayment(BuildContext context) {
//     // Cancel payment logic
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Payment Cancellation'),
//           content: Text('Payment canceled.'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Receipt'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Receipt Details',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Account Number: $accountNumber',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Bank: $bank',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Branch: $branch',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Organization: $organization',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'GST Number: $gstinNumber',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 32),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => confirmPayment(context),
//                   child: Text('Confirm Payment'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => cancelPayment(context),
//                   child: Text('Cancel Payment'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
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