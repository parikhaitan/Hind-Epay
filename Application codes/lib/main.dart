import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hind_e_pay/CommonScreens/SplashScreen.dart';
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
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of Hind-e Pay application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
