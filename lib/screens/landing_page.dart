import 'package:bridge/screens/home_screen.dart';
import 'package:bridge/screens/signIn_screen.dart';
import 'package:bridge/services/auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  LandingPage({@required this.auth});

  final AuthBase auth;
  static String id = "LandingPage";

  @override

  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User _user;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async{
    User user = await widget.auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(User user){
  setState(() {
    _user = user;
  });
  }

  @override
  Widget build(BuildContext context) {
    if(_user == null) {
      return LoginScreen(
        auth: widget.auth,
        onSignIn: _updateUser,
      );
    }
    return Home(
      auth: widget.auth,
      onSignOut: () => _updateUser(null),
    );
  }
}
