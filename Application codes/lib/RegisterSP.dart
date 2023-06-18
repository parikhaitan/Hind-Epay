import 'package:flutter/material.dart';
import 'package:hind_e_pay/reusable_widget.dart';

class RegisterSP extends StatelessWidget {
  static final String title = 'REGISTER';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _RegisterSP createState() => _RegisterSP();
}

class _RegisterSP extends State<MainPage> {
  TextEditingController _orgNameController = TextEditingController();
  TextEditingController _serviceNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  String selectedValue = "Government";
  int price = 2;
  bool isuploaded = false;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Government"), value: "Government"),
      DropdownMenuItem(child: Text("Private"), value: "Private"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBarOpp(MediaQuery.of(context).size.width, "REGISTER", context),
      backgroundColor: Colors.white,
      body:Container(
    child:
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
        child:  Container(
          width: MediaQuery.of(context).size.width,
         // height: (0.8 * MediaQuery.of(context).size.height),
          alignment: Alignment.topCenter,
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(height: 0.02 * MediaQuery.of(context).size.height,),
                        Container(
                          width: 0.9 * MediaQuery.of(context).size.width,
                          height: 0.1 * MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ], // color: Colors.orangeAccent,
                          ),
                          child:Row(

                            children: [
                              SizedBox(height: 10),
                              SizedBox(width: 10),
                              Icon(Icons.account_balance_sharp, size: 45,color: Colors.white),
                              SizedBox(width: 10),
                              // image: ,
                              Flexible(
                                child: Text(
                                    'Organisation Type:   ',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(width: 3),
                              new DropdownButton(
                                  value: selectedValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                    ///backend
                                    if (selectedValue == "Government") {
                                      price = 5;
                                    }
                                    else {
                                      price = 2;
                                    }
                                  },
                                  items: dropdownItems
                              ),
                            ],
                          ),
                        ),
                      ],
                    ), SizedBox(height: 13),
                    Column(
                      children: [
                        Column(
                          children: [
                            ReusableTextFieldWithTitle(context, "Organisation Name", _orgNameController,"Organisation Name"),
                          ],
                        ),SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                        Column(
                          children: [
                            ReusableTextFieldWithTitle(context, "User Name", _userNameController, "Your Name"),
                          ],
                        ),
                        SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                        Column(
                          children: [
                            ReusableTextFieldWithTitle(context, "Service name", _serviceNameController,"Service Name"),
                          ],
                        ),SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                        Column(
                          children: [
                            ReusableTextFieldWithTitle(context, "Phone Number", _phoneNumberController, "+91XXXXXXXXXX"),
                          ],
                        ),
                        SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                        FloatingActionButton.extended(
                          heroTag: "Done",
                          onPressed: () => {},
                          label: Text('Confirm Details'),
                          backgroundColor: Color(0xff20c215),
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
