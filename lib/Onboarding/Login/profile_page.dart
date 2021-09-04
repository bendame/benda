import 'LoginPage.dart';
import 'package:benda/Onboarding/Login/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name: ${_currentUser.displayName}',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              SizedBox(height: 16.0,),
              Text(
                'EMAIL: ${_currentUser.email}',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              SizedBox(height: 16.0,),
              _currentUser.emailVerified ? Text('Email Verified', style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.green),) : Text(
                'Email not verified',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.red),
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () async {
                    await _currentUser.sendEmailVerification();
                  }, child: Text('Verify email')),
                  IconButton(onPressed: () async {
                    User? user = await FireAuth.refreshUser(_currentUser);
                  }, icon: Icon(Icons.refresh),),

                ],
              ),
              ElevatedButton(onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage(),));
              }, child: Text('Sign Out'),),
            ]
        ),
      ),
    );
  }
}
