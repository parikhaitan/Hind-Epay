import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class Voucher {
  final String nameOfService;
  final int numberOfVouchers;
  final double amountPerVoucher;
  final DateTime expirationDate;

  Voucher({
    required this.nameOfService,
    required this.numberOfVouchers,
    required this.amountPerVoucher,
    required this.expirationDate,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Rupi Transaction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _voucherController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  List<Voucher> _vouchers = [];

  void _createVoucher() {
    if (_formKey.currentState!.validate()) {
      final newVoucher = Voucher(
        nameOfService: _serviceController.text,
        numberOfVouchers: int.parse(_voucherController.text),
        amountPerVoucher: double.parse(_amountController.text),
        expirationDate: _selectedDate,
      );

      setState(() {
        _vouchers.add(newVoucher);
      });

      _serviceController.clear();
      _voucherController.clear();
      _amountController.clear();
    }
  }

  void _deleteVoucher(int index) {
    setState(() {
      _vouchers.removeAt(index);
    });
  }

  void _payNow() {
    double totalAmount = 0;
    for (var voucher in _vouchers) {
      totalAmount += voucher.numberOfVouchers * voucher.amountPerVoucher;
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
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: _serviceController,
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
                  controller: _voucherController,
                  decoration: InputDecoration(labelText: 'Number of Vouchers'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the number of vouchers';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Invalid number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _amountController,
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
                        '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _createVoucher,
                  child: Text('Create Voucher'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentConfirmationPage(
                          vouchers: _vouchers,
                          totalAmount: _calculateTotalAmount(),
                        ),
                      ),
                    );
                  },
                  child: Text('Pay Now'),
                ),
                SizedBox(height: 16.0),
                Text('Vouchers:'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _vouchers
                      .asMap()
                      .entries
                      .map(
                        (entry) => ListTile(
                      title: Text(entry.value.nameOfService),
                      subtitle: Text(
                        'Vouchers: ${entry.value.numberOfVouchers}, Amount: ${entry.value.amountPerVoucher}, Expiration: ${entry.value.expirationDate}',
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteVoucher(entry.key),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _calculateTotalAmount() {
    double totalAmount = 0;
    for (var voucher in _vouchers) {
      totalAmount += voucher.numberOfVouchers * voucher.amountPerVoucher;
    }
    return totalAmount;
  }
}

class PaymentConfirmationPage extends StatelessWidget {
  final List<Voucher> vouchers;
  final double totalAmount;

  const PaymentConfirmationPage({
    required this.vouchers,
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
                itemCount: vouchers.length,
                itemBuilder: (context, index) {
                  final voucher = vouchers[index];
                  return ListTile(
                    title: Text(voucher.nameOfService),
                    subtitle: Text(
                      'Vouchers: ${voucher.numberOfVouchers}, Amount: ${voucher.amountPerVoucher}, Expiration: ${voucher.expirationDate}',
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
                // Perform payment logic
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}