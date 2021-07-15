import 'package:benda/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SignInPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthentificationService>(
          create: (_) => AuthentificationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthentificationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthentificationWrapper(),
      ),
    );
  }
}

class AuthentificationWrapper extends StatelessWidget {
  const AuthentificationWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Signed In"),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthentificationService>().signOut();
                },
                child: Text("Sign Out"),
              )
            ],
          ),
        ),
      );
    }
    return SingInPage();
  }
}
