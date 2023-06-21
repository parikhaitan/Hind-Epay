import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/ServiceProvider/HomeScreenSP.dart';
import 'package:hind_e_pay/CommonScreens/SplashScreen.dart';

import 'Backend/firebase_config.dart';

import 'ServiceProvider/passCodeSetterSP.dart';
import 'User/ERupiHome.dart';
import 'User/passCodeSetterUser.dart';
import 'ServiceProvider/BankDetails.dart';
import 'ServiceProvider/GenrateVouchers.dart';
import 'ServiceProvider/ViewHistory.dart';
import 'ServiceProvider/VoucherInfoSP.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Hind Epay',
    options: FirebaseOptions(
      apiKey: FirebaseConfig.apiKey,
      projectId: FirebaseConfig.projectId,
      appId: FirebaseConfig.appId,
      messagingSenderId: FirebaseConfig.messagingSenderId,
     // measurementId: FirebaseConfig.measurementId,
    ),
  );
  runApp(const MyApp());
  // runApp(MaterialApp(
  //   initialRoute: 'splashScreen',
  //   debugShowCheckedModeBanner:false,
  //
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hind E pay',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
