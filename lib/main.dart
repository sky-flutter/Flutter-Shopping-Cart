import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

void main() => runApp(new MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{},
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  navigatePage() {
    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) => Login()));
  }

  splashMove() {
    return Timer(Duration(seconds: 4), navigatePage);
  }

  @override
  void initState() {
    super.initState();
    splashMove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          color: Colors.white,
          child: Center(
            child: Image(
              image: AssetImage("images/ic_logo.png"),
              height: 140,
              width: 140,
            ),
          )),
    );
  }
}
