import 'package:flutter/material.dart';
import 'package:hind_e_pay/HomeScreenSP.dart';
import 'package:hind_e_pay/registerChoice.dart';
import 'package:hind_e_pay/reusable_widget.dart';
import 'HomeUser.dart';


class SelectRole extends StatefulWidget {
  const SelectRole({Key? key}) : super(key: key);

  @override
  State<SelectRole> createState() => _SelectRole();
}

class _SelectRole extends State<SelectRole> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.7 * MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50), ),
                color: Color(0xfffff5f5),
                image: DecorationImage(
                  image: AssetImage('Assets/Images/Hind e-pay logo.png'),
                  scale: 0.05,
                  alignment: Alignment.center,
                ),
              ),//     color: Color(0xfffff5f5),
            ),
        SizedBox(height: 0.01 *MediaQuery.of(context).size.height,),
            Text('Login as',
              textAlign: TextAlign.center,
              style : TextStyle(
                  fontSize: 26,
                  color:  Colors.white,
                  fontWeight: FontWeight.w600),),
            SizedBox(height: 0.01 *MediaQuery.of(context).size.height,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              width:0.06 *MediaQuery.of(context).size.width,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  HomeUser()));
              },
              child:reusableRectangleButton(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, "User"),
            ),
            SizedBox(
              width:0.12 *MediaQuery.of(context).size.width,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  HomeScreen()));
                },
                child: reusableRectangleButton(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, "Service Provider"),
            ),

          ]
        ), SizedBox(height: 0.02 *MediaQuery.of(context).size.width,),
            Text('--------or sign up--------',
              textAlign: TextAlign.center,
              style : TextStyle(
                  fontSize: 16,
                  color:  Colors.white,
                  fontWeight: FontWeight.w600
              ),),


            SizedBox(height: 10,),
            FloatingActionButton.extended(

              heroTag: "Done",
              onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>  RegisterChoice()))
              },
              label: Text('Create Account',
                textAlign: TextAlign.center,
                style : TextStyle(
                    fontSize: 20,
                    color:  Color(0xfff16f00),
                    fontWeight: FontWeight.w600
                    ),),
              //   icon: Icons.attach_file,
              backgroundColor: Colors.white,
              // icon: Icon(Icons.payment),
            ),
          ],
        ),
      ),
    );
  }
}
