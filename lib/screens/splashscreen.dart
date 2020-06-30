import 'dart:async';
import 'package:bridge/screens/landing_page.dart';
import 'package:bridge/screens/signIn_screen.dart';
import 'package:bridge/screens/widgets/header.dart';
import 'package:bridge/services/auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  static String id = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, LandingPage.id)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: decoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            header(context),
            Text(
              "Bridge",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
