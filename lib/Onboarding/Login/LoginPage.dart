import 'package:benda/Onboarding/Login/auth_services.dart';
import 'package:benda/Onboarding/Login/profile_page.dart';
import 'package:benda/Onboarding/Login/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    //Initialize FirebaseApp
    Future<FirebaseApp> _initializeFirebase() async {
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              user: user,
            ),
          ),
        );
      }
      return firebaseApp;
    }

    Container _emailTextField = Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'Input the email',
          labelText: 'Email',
        ),
        controller: _emailController,
        focusNode: _focusEmail,
        validator: (value) => Validator.validateEmail(email: value),
      ),
    );

    Container _passwordTextField = Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          hintText: 'Input your password',
          labelText: 'Password',
        ),
        controller: _passwordController,
        focusNode: _focusPassword,
        obscureText: true,
        validator: (value) => Validator.validatePassword(password: value),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Image.asset(
            "assets/images/benda3.png",
            fit: BoxFit.cover,
            color: Colors.white,
            scale: 45,
          ),
        ),
      ),
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    flexibleSpace: Column(
                      children: [
                        TabBar(
                          tabs: [
                            Container(
                              height: 52,
                              child: ListTile(
                                title: Text("Sign In"),
                                leading: Icon(Icons.login),
                              ),
                            ),
                            Container(
                              height: 52,
                              child: ListTile(
                                title: Text("Sign Up"),
                                leading: Icon(Icons.login),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 50, 30, 30),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(1),
                                  child: Image.asset(
                                    "assets/images/benda3.png",
                                    scale: 5,
                                    fit: BoxFit.cover,
                                    color: Color.fromRGBO(19, 123, 212, 1),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      _emailTextField,
                                      _passwordTextField,
                                      Column(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                User? user = await FireAuth
                                                    .signInUsingEmailPassword(
                                                  email: _emailController.text,
                                                  password:
                                                      _passwordController.text,
                                                  context: context,
                                                );
                                                if (user != null) {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ProfilePage(
                                                                      user:
                                                                          user)));
                                                }
                                              }
                                            },
                                            child: Text("Sign In"),
                                            style: ElevatedButton.styleFrom(
                                              textStyle:
                                                  TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      RegisterPage(),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
