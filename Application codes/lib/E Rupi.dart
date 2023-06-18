import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/reusable_widget.dart';

class ERupi extends StatefulWidget {
  const ERupi({Key? key}) : super(key: key);

  @override
  State<ERupi> createState() => _ERupi();
}

class _ERupi extends State<ERupi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBarOpp(MediaQuery.of(context).size.width, "E RUPI", context),
      resizeToAvoidBottomInset: true,

      backgroundColor: Colors.white,
      body:
      Container(


        child: Row(
          children: [
            SizedBox(width: 0.05* MediaQuery.of(context).size.width),
            Column(
              children:[
                SizedBox(height: 0.07* MediaQuery.of(context).size.height),
                Image.asset(
                  "Assets/Images/E Rupi icon.png",
                ),
                SizedBox(height: 0.06* MediaQuery.of(context).size.height),
                reusableRowContainerBG(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, "ADD VOUCHER", Icon(
                    CupertinoIcons.plus_square_fill_on_square_fill,
                    size: 40,
                    color: Colors.white)),
                SizedBox(height: 0.03* MediaQuery.of(context).size.height),
                reusableRowContainerBG(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width,
                "VIEW VOUCHER", Icon(
                    CupertinoIcons.arrow_right_square_fill,
                    size: 40,
                    color: Colors.white)),
                SizedBox(height: 0.03* MediaQuery.of(context).size.height),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
