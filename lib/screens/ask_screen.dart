import 'package:bridge/screens/signIn_screen.dart';
import 'package:bridge/screens/widgets/buttons.dart';
import 'package:bridge/screens/widgets/header.dart';
import 'package:flutter/material.dart';

class AskScreen extends StatelessWidget {
  static String id = "AskScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decoration(),
        child: Column(
          children: <Widget>[
            header(context),
            CustomButton(
              onPressed: (){},
              color: Colors.white,
              child: Center(
                child: Text("Register Now",
                  style: TextStyle(
                      fontSize: 20  ,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal[600]
                  ),),
              ),),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.08,
            ),
            CustomButton(
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.white,
              child: Center(
                child: Text("Donate Now",
                  style: TextStyle(
                      fontSize: 20  ,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal[600]
                  ),),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.08,
            ),


          ],
        ),
      ),
    );
  }
}
