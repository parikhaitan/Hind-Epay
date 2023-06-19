import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/SplashScreen.dart';

import 'Backend/firebase_config.dart';


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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
