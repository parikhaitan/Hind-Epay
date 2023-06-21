///This is the home screen for vouchers -- user can navigate to either his money wallet or E-Rupi Home page from here

import 'package:flutter/material.dart';
import 'package:hind_e_pay/CommonScreens/reusable_widget.dart';
import 'ERupiHome.dart';
import 'WalletUser.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUser();
}

class _HomeUser extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      reusableAppBarLogout(MediaQuery.of(context).size.width, "Home", context),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfff16f00),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg screen.png'),
              fit: BoxFit.cover),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 0.28 * MediaQuery.of(context).size.width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.08 * MediaQuery.of(context).size.height,
                ),
                SizedBox(
                  width: 0.07 * MediaQuery.of(context).size.width,
                ),

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => WalletUser()));
                  },
                  child: reusableContainerButton(
                      MediaQuery.of(context).size.height,
                      MediaQuery.of(context).size.width,
                      0.3,
                      0.4,
                      Image.asset(
                        'Assets/Images/Wallet.png',
                      ),
                      "WALLET"),
                ),
                SizedBox(
                  height: 0.06 * MediaQuery.of(context).size.height,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ERupiHome()));
                  },
                  child: reusableContainerButton(
                      MediaQuery.of(context).size.height,
                      MediaQuery.of(context).size.width,
                      0.3,
                      0.4,
                      Image.asset(
                        'Assets/Images/E rupi.png',
                      ),
                      "E-RUPI"),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.055,
            ),
          ],
        ),
      ),
    );
  }
}
