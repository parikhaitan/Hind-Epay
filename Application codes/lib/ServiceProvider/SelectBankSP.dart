import 'package:flutter/material.dart';


class SelectBank extends StatelessWidget {
  final String inTab;

  const SelectBank(this.inTab, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //appBar: AppBar(title: const Text('Page 1')),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xfffff5f5),
          child: Stack(
            children:[

              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.8 *MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(54.67), bottomRight: Radius.circular(54.67), ),
                      color: Color(0xfff16f00),
                    ),
                    child: Stack(
                      children:[
                        Positioned(
                          left: 13,
                          top: 412,
                          child: Container(
                            width: 343,
                            height: 207,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 193,
                          top: 292,
                          child: Container(
                            width: 170,
                            height: 106,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 13,
                          top: 165,
                          child: Container(
                            width: 350,
                            height: 114,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 173,
                          child: SizedBox(
                            width: 341,
                            child: Text(
                              "Enter the service you would like to provide through the voucher: ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 299,
                          child: SizedBox(
                            width: 146,
                            child: Text(
                              "Enter amount per voucher:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 203,
                          top: 299,
                          child: SizedBox(
                            width: 152,
                            child: Text(
                              "Enter expiration date:",
                              style: TextStyle(
                                color: Color(0xfffff5f5),
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 420,
                          child: SizedBox(
                            width: 319,
                            child: Text(
                              "Upload database of recipients:",
                              style: TextStyle(
                                color: Color(0xfffff5f5),
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 21,
                          top: 233,
                          child: Container(
                            width: 333,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xfffff5f5),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 201,
                          top: 354,
                          child: Container(
                            width: 155,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xfffff5f5),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 13,
                          top: 292,
                          child: Container(
                            width: 170,
                            height: 106,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 21,
                          top: 354,
                          child: Container(
                            width: 155,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xfffff5f5),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 112,
                          top: 634,
                          child: Container(
                            width: 161,
                            height: 49,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xff20c215),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 452,
                          child: Container(
                            width: 318,
                            height: 154,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xffd6d1d1), width: 3, ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xfffff5f5),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 159,
                          top: 498,
                          child: Opacity(
                            opacity: 0.60,
                            child: Container(
                              width: 57,
                              height: 61,
                              child: FlutterLogo(size: 57),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 35,
                          top: 239,
                          child: SizedBox(
                            width: 189,
                            height: 19,
                            child: Text(
                              "Enter service here...",
                              style: TextStyle(
                                color: Color(0xffd5d1d1),
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 166,
                          top: 644,
                          child: SizedBox(
                            width: 53,
                            child: Text(
                              "PAY",
                              style: TextStyle(
                                color: Color(0xfffff5f5),
                                fontSize: 24,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 417,
                    height: 145,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:[
                        Container(
                          width: 410,
                          height: 135,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(59.44), bottomRight: Radius.circular(59.44), ),
                            color: Color(0xfffff5f5),
                          ),
                          child: Stack(
                            children:[
                              Positioned(
                                left: 179,
                                top: 28,
                                child: SizedBox(
                                  width: 231,
                                  child: Text(
                                    "GENERATE VOUCHER",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 315,
                                top: 45,
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: FlutterLogo(size: 44),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 616.50),
                        Container(
                          width: 212,
                          height: 114,
                          child: FlutterLogo(size: 114),
                        ),
                        SizedBox(height: 616.50),
                        Transform.rotate(
                          angle: 1.57,
                          child: Container(
                            width: 16.50,
                            height: 20.50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xff14002f), width: 2, ),
                              color: Color(0x7f7f3a44),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    //Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text('in $inTab Page 1'),
        //     ElevatedButton(
        //         onPressed: () {
        //           Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => SelectBank(inTab)));
        //         },
        //         child: const Text('Go to page2'))
        //   ],
        // ),
      ),
    );
  }
}
