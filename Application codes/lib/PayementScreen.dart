import 'package:flutter/material.dart';
import 'package:hind_e_pay/reusable_widget.dart';

class PayementScreen extends StatelessWidget {
  static final String title = 'Bank Details';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _orgNameController = TextEditingController();
  TextEditingController _AccNumController = TextEditingController();
  TextEditingController _IFSCCodeController = TextEditingController();
  TextEditingController _GSTINController = TextEditingController();
  String selectedValue = "HDFC";
  int price = 2;
  bool isuploaded = false;
  final myController = TextEditingController();

  // late DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    // dbRef = FirebaseDatabase.instance.ref().child('Uploads');
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("HDFC"), value: "HDFC"),
      DropdownMenuItem(child: Text("SBI"), value: "SBI"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    //final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
       appBar: reusableAppBarOpp(MediaQuery.of(context).size.width, "Bank Details", context),
      backgroundColor: Color(0xfffff5f5),
      body: Container(
        alignment: Alignment.topCenter,
    // child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: (0.8 * MediaQuery.of(context).size.height),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
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
                              ],
                              // color: Colors.orangeAccent,
                            ),
                            child:Row(
                              children: [
                                SizedBox(height: 10),
                                SizedBox(width: 10),
                                Icon(Icons.account_balance_sharp, size: 45,color: Color(0xfffff5f5)),
                                SizedBox(width: 10),
                               // image: ,
                                Flexible(
                                  child: Text(
                                      'Select bank :   ',
                                      textAlign: TextAlign.start,
                                      // softWrap: false,
                                      // overflow: TextOverflow.ellipsis,
                                      style: TextStyle(

                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xfffff5f5),
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
                                      if (selectedValue == 'Coloured') {
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
                              Container(
                                width: 0.9 * MediaQuery.of(context).size.width,
                                height: 0.55 * MediaQuery.of(context).size.height,
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
                                  ],
                                  //color: Colors.orangeAccent,
                                ),
                                child:Column(
                                  children: [
                                    SizedBox(height: 8),
                                    Flexible(
                                      child: Text(
                                          'ENTER BANK DETAILS  ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xfffff5f5),
                                          )
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                          'Organisation Name   ',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xfffff5f5),
                                          )
                                      ),
                                    ),
                                    Container(
                                      width: 0.8 * MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color:Color(0xfffff5f5),
                                      ),
                                      child: TextField(
                                        controller: _orgNameController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                           // hintText: "100",
                                        ),textAlign: TextAlign.left,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Flexible(
                                      child: Text(
                                          'Account number   ',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xfffff5f5),
                                          )
                                      ),
                                    ),
                                    Container(
                                      width: 0.8 * MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Color(0xfffff5f5),
                                      ),
                                      child: TextField(
                                        controller: _AccNumController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                         // hintText: "100",
                                        ),textAlign: TextAlign.left,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Flexible(
                                      child: Text(
                                          'IFSC Code   ',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color:Color(0xfffff5f5),
                                          )
                                      ),
                                    ),
                                    Container(
                                      width: 0.8 * MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Color(0xfffff5f5),
                                      ),
                                      child: TextField(
                                        controller: _IFSCCodeController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        //  hintText: "100",
                                        ),textAlign: TextAlign.left,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Flexible(
                                      child: Text(
                                          'GSTIN   ',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xfffff5f5),
                                          )
                                      ),
                                    ),
                                    Container(
                                      width: 0.8 * MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Color(0xfffff5f5),
                                      ),
                                      child: TextField(
                                        controller: _GSTINController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          //hintText: "100",
                                        ),textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
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
              ],
            ),
          ),
       // ),
      ),
       ),
    );
  }
}