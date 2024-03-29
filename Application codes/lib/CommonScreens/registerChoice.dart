///This screen contains the code for choice of User or service provider while registering

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/CommonScreens/reusable_widget.dart';
import '../ServiceProvider/Login-signin/RegisterSP.dart';
import '../User/Login-signin/RegisterUser.dart';

class RegisterChoice extends StatefulWidget {
  const RegisterChoice({Key? key}) : super(key: key);

  @override
  State<RegisterChoice> createState() => _RegisterChoice();
}

class _RegisterChoice extends State<RegisterChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBarOpp(
          MediaQuery.of(context).size.width, "REGISTER", context),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfffff5f5),
      body: Container(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.4 * MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Color(0xfffff5f5),
                    image: DecorationImage(
                      image: AssetImage('Assets/Images/Hind e-pay logo.png'),
                      scale: 0.05,
                      alignment: Alignment.center,
                    ),
                  ), //     color: Color(0xfffff5f5),
                ),
                SizedBox(height: 0.05 * MediaQuery.of(context).size.height),
                SizedBox(
                  child: MaterialButton(
                      padding: EdgeInsets.all(4.0),
                      textColor: Color(0xfffff5f5),
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: reusableRowContainerBG(
                          MediaQuery.of(context).size.height,
                          MediaQuery.of(context).size.width,
                          "USER",
                          Icon(CupertinoIcons.person,
                              size: 40, color: Color(0xfffff5f5))),
                      // ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterUserMainPage()));

                        ///bank option page
                      }),
                ),
                SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                SizedBox(
                  child: MaterialButton(
                      padding: EdgeInsets.all(4.0),
                      textColor: Color(0xfffff5f5),
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: reusableRowContainerBG(
                          MediaQuery.of(context).size.height,
                          MediaQuery.of(context).size.width,
                          "SERVICE PROVIDER",
                          Icon(CupertinoIcons.building_2_fill,
                              size: 40, color: Color(0xfffff5f5))),
                      // ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterSPMainPage()));

                        ///bank option page
                      }),
                ),
                SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
