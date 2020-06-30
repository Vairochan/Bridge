import 'package:bridge/screens/landing_page.dart';
import 'package:bridge/screens/widgets/custom_drawer.dart';
import 'package:bridge/screens/widgets/header.dart';
import 'package:bridge/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final VoidCallback onSignOut;
  final AuthBase auth;

  Home({this.onSignOut, this.auth});
  static String id = "Home";
  Future<void> _signOut() async{
    try{
      await auth.signOut();
      onSignOut();
    }catch(e){
      print(e.toString());
    }
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: widget._signOut,
            child: Text("Logout",
            style: TextStyle(
              color: Colors.teal[100]
            ),),
          )
        ],
        elevation: 50,
        iconTheme: IconThemeData(
          color: Colors.teal[100]
        ),
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      drawer: CustomDrawer(),
      body: Container(
        decoration: decoration(),
      ),
    );
  }
}
