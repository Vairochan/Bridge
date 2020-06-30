import 'package:bridge/screens/ask_screen.dart';
import 'package:bridge/screens/home_screen.dart';
import 'package:bridge/screens/landing_page.dart';
import 'package:bridge/screens/signIn_screen.dart';
import 'package:bridge/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:bridge/services/auth.dart';


void main(){

  runApp(MaterialApp(
    title: "Bridge",  
    initialRoute: SplashScreen.id,
     routes: {
      SplashScreen.id: (context) => SplashScreen(),
      AskScreen.id: (context) => AskScreen(),
      LoginScreen.id: (context) => LoginScreen(auth: Auth(),),
      Home.id: (context) => Home(),
      LandingPage.id: (context) => LandingPage(auth: Auth()),
    },
  ));

}
