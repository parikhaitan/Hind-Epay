import 'package:flutter/material.dart';
import 'package:hind_e_pay/reusable_widget.dart';

class RegisterUser extends StatelessWidget {
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
  _RegisterUser createState() => _RegisterUser();
}

class _RegisterUser extends State<MainPage> {
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
      backgroundColor: Color(0xfffff5f5),
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
                // SizedBox(height: 13),
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 0.2 * MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
                            color: Color(0xfffff5f5),
                            image: DecorationImage(
                              image: AssetImage('Assets/Images/Hind e-pay logo.png'),
                              scale: 0.05,
                              alignment: Alignment.center,
                            ),
                          ),//     color: Color(0xfffff5f5),
                        ),
                       // SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                        ReusableTextFieldWithTitle(context, "User Name", _orgNameController,"ABC"),
                      ],
                    ),SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    Column(
                      children: [
                        ReusableTextFieldWithTitle(context, "Phone Number", _userNameController, "XXXXXXXXXX"),
                      ],
                    ),
                    SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    Column(
                      children: [
                        ReusableTextFieldWithTitle(context, "EMAIL ID", _serviceNameController,"abc@gmail.com"),
                      ],
                    ),SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                    FloatingActionButton.extended(
                      heroTag: "Done",
                      onPressed: () => {},
                      label: Text('Confirm Details'),
                      backgroundColor: Color(0xff20c215),
                    ),
                  ],
                ),
                Text("OR"),

                TextButton(
                  onPressed: () {},
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Already have an account?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(text: "Login".toUpperCase())
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
