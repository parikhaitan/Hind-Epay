import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/reusable_widget.dart';

class WalletUser extends StatefulWidget {
  const WalletUser({Key? key}) : super(key: key);

  @override
  State<WalletUser> createState() => _WalletUser();
}

class _WalletUser extends State<WalletUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          reusableAppBar(MediaQuery.of(context).size.width, "Wallet", context),
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg screen.png'),
              fit: BoxFit.cover),
        ),
        child: Row(
          children: [
            SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
            Column(
              children: [
                SizedBox(height: 0.1 * MediaQuery.of(context).size.height),
                reusableRowContainer(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width,
                    Image.asset(
                      "Assets/Images/Deposit-Money-Icon.png",
                    ),
                    "DEPOSIT"),
                SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                reusableRowContainer(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width,
                    Image.asset(
                      "Assets/Images/withdrw.png",
                    ),
                    "WITHDRAW"),
                SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                reusableRowContainer(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width,
                    Image.asset(
                      "Assets/Images/balance chek.png",
                    ),
                    "BALANCE"),
                SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
                reusableRowContainer(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width,
                    Image.asset(
                      "Assets/Images/upi png.png",
                    ),
                    "UPI"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
