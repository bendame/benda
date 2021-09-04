import 'package:flutter/material.dart';

class NewUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Image.asset(
          "assets/images/benda3.png",
          fit: BoxFit.cover,
          color: Colors.white,
          scale: 45,
        )),
      ),
    );
  }
}

