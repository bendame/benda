import 'package:flutter/material.dart';
import './chat.dart';
import './home.dart';
import './promo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Benda',
      home: MyAppBarWidget(),
    );
  }
}

class MyAppBarWidget extends StatelessWidget {
  const MyAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.stream_rounded),
                  Center(
                    child: Text("Promo"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home),
                  Center(
                    child: Text("Home"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.mail),
                  Center(
                    child: Text("Help"),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Promo(),
            Home(),
            Chat(),
          ],
        ),
      ),
    );
  }
}

