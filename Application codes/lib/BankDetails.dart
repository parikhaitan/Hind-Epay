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
                  // 'Bank A',
                  // 'Bank B',
                  // 'Bank C',
                  'State Bank Of India',
                  'Bank of Baroda',
                  'Canara Bank',
                  'HDFC Bank',
                  'ICICI Bank',
                  'Indian Bank',
                  'Induslnd Bank',
                  'Kotak Mahindra Bank',
                  'Punjab National Bank',
                  'Unioun Bank of India'
                  // Add your list of banks here
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
              // Add other input fields here (e.g., select branch, organization name, etc.)

              DropdownButtonFormField<String>(
                value: _selectedBranch,
                onChanged: (value) {
                  setState(() {
                    _selectedBranch = value;
                  });
                },
                items: <String>[
                  'Bank A',
                  'Bank B',
                  'Bank C',
                  // 'State Bank Of India',
                  // 'Bank of Baroda',
                  // 'Canara Bank',
                  // 'HDFC Bank',
                  // 'ICICI Bank',
                  // 'Indian Bank',
                  // 'Induslnd Bank',
                  // 'Kotak Mahindra Bank',
                  // 'Punjab National Bank',
                  // 'Unioun Bank of India'
                  // Add your list of banks here
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
              // Add other text form fields here
              //
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _accountNumber = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: ' Account number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the account number';
                  }
                  return null;
                },
              ),

              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _gstinNumber = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: ' GST number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the gst number';
                  }
                  return null;
                },
              ),

              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _ifscCode = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: ' IFSC number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ifsc number';
                  }
                  return null;
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    // Save the data to Firebase Firestore
                    saveDataToFirestore();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveDataToFirestore() async {
    try {
      final CollectionReference erupiVouchers =
          FirebaseFirestore.instance.collection('erupivouchers');

      await erupiVouchers.add({
        'bank': _selectedBank,
        'branch': _selectedBranch,
        'organisationName': _organisationName,
        'accountNumber': _accountNumber,
        'ifscCode': _ifscCode,
        'gstinNumber': _gstinNumber,
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Data saved successfully'),
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

      // Reset the form
      if (_formKey.currentState != null) {
        _formKey.currentState!.reset();
      }
    } catch (e) {
      print('Error saving data: $e');
    }
  }
}