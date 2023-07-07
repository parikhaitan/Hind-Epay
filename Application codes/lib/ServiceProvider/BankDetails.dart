///The service provider is entering the bank details here for payement for voucher generation

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hind_e_pay/CommonScreens/reusable_widget.dart';
import 'VerifyBankDetailsOTP.dart';


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
  static String verify ="";
  @override
  _ErupiTransactionFormState createState() => _ErupiTransactionFormState();
}

class _ErupiTransactionFormState extends State<ErupiTransactionForm> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedBank;
  String? _selectedBranch;
  String? _organisationName;
  String? _accountNumber;
  String? ifscCode;
  String nums = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:reusableAppBarOpp( MediaQuery.of(context).size.width, "Bank details", context),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'Assets/Images/Hind e-pay logo.png',
                  height: 0.3 * MediaQuery.of(context).size.height,
                  width: 0.8 * MediaQuery.of(context).size.width,
                ),

                //Choosing the bank he want to get his voucher generated from
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

                //selecting the brank of that bank involved in the process
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

                //organization name
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

                //account number
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

                //IFSC Code
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      ifscCode = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'IFSC Code',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter IFSC code';
                    }
                    return null;
                  },
                ),


                SizedBox(height:MediaQuery.of(context).size.height * 0.05 ),
                FloatingActionButton.extended(
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      // Check if the account number exists in the database
                      checkAccountNumberExistence();
                    }
                  },
                  label: Text('Confirm Bank Details'),
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

  //checking whther the entered account number is valid or not -- the money will be transferred from this account to the banks account
  //we have stimulated the environment here as it was not possible to send money to banks account without integrating E Rupi API
  Future<void> checkAccountNumberExistence() async {
    try {
      final CollectionReference accounts =
      FirebaseFirestore.instance.collection('accounts');

      final QuerySnapshot snapshot = await accounts
          .where('accountNumber', isEqualTo: _accountNumber)
          .get();
      snapshot.docs.forEach((doc) {
        nums = doc['phone_number'];
        });
      print(nums);

      if (snapshot.docs.isNotEmpty) {
      //  await FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
        await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: nums,
            verificationCompleted:
                (PhoneAuthCredential credential) {},
            verificationFailed: (FirebaseAuthException e) {},
            codeSent: (String verificationId, int? resendToken) {
              //Navigator.pushNamed(context, 'verify');
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VerifyBankDetailsOTP()));
              ErupiTransactionForm.verify = verificationId;
            },
            codeAutoRetrievalTimeout: (String verificationId) {});
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

  //Payement confirmation screen
  void confirmPayment(BuildContext context) {
         AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          showCloseIcon: true,
          title: "Payment confirmed",
          desc: "Vouchers have been generated!",
          btnOkOnPress: () {},
        )..show();

   // );
  }

  //payement cancellation screen
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