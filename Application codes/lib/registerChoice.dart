import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/reusable_widget.dart';
import 'RegisterSP.dart';
import 'RegisterUser.dart';
import 'VoucherInfoSP.dart';


class RegisterChoice extends StatefulWidget {
  const RegisterChoice({Key? key}) : super(key: key);

  @override
  State<RegisterChoice> createState() => _RegisterChoice();
}

class _RegisterChoice extends State<RegisterChoice> {
  // const TabPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBarOpp(MediaQuery.of(context).size.width, "REGISTER", context),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfffff5f5),
      body:
      Container(
        child: Row(
          children: [
           // SizedBox(width: 0.05* MediaQuery.of(context).size.width),
            Column(
              children:[
               // SizedBox(height: 0.07* MediaQuery.of(context).size.height),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.4 * MediaQuery.of(context).size.height,
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
                // Image.asset(
                //   "Assets/Images/Hind e-pay logo.png",
                //   scale: 0.05,
                //   alignment: Alignment.center,
                // ),
                SizedBox(height: 0.05* MediaQuery.of(context).size.height),
                SizedBox(
                  child: MaterialButton(
                      padding: EdgeInsets.all(4.0),
                      textColor: Color(0xfffff5f5),
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: reusableRowContainerBG(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, "USER", Icon(
                          CupertinoIcons.person,
                          size: 40,
                          color: Color(0xfffff5f5))),
                      // ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  RegisterUser())); ///bank option page
                      }
                  ),
                ),
                SizedBox(height: 0.03* MediaQuery.of(context).size.height),

                SizedBox(
                  child: MaterialButton(
                      padding: EdgeInsets.all(4.0),
                      textColor: Color(0xfffff5f5),
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: reusableRowContainerBG(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width,
                          "SERVICE PROVIDER", Icon(
                              CupertinoIcons.building_2_fill,
                              size: 40,
                              color: Color(0xfffff5f5))),
                      // ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  RegisterSP())); ///bank option page
                      }
                  ),
                ),
                SizedBox(height: 0.03* MediaQuery.of(context).size.height),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
