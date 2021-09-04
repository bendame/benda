import 'package:benda/Onboarding/Login/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'bendaColor/primaryColor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BendaApp());
}

class BendaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Benda",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: PrimaryColorMaterial.generateMaterialColor(
            Color.fromRGBO(19, 123, 212, 1)),
        fontFamily: 'Lato',
      ),
      home: LoginPage(),
    );
  }
}
