import 'package:bridge/screens/widgets/buttons.dart';
import 'package:bridge/screens/widgets/header.dart';
import 'package:bridge/services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  final AuthBase auth;
  final Function(User) onSignIn;

  LoginScreen({@required this.auth, this.onSignIn});

  static String id = "SigninScreen";
  @override
  Widget build(BuildContext context) {
    return Mobile(auth: Auth(),);
  }
}

class Desktop extends StatelessWidget {
  final AuthBase auth;
  final Function(User) onSignIn;

  Desktop({@required this.auth, this.onSignIn});

  Future<void> signInAnonymously() async{
    try{
      User user = await auth.signInAnonymously();
      onSignIn(user);
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> signInWithGoogle() async{
    try{
      await auth.signinWithGoogle();

    }catch(e){
      print(e.toString());
    }
  }
  Future<void> signInWithFacebook() async{
    try{
      await auth.signInWithFacebook();

    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decoration(),
        child: Column(
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  header(context),
                  CustomButton(
                    onPressed: signInWithFacebook,
                    color: Colors.indigo[600],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/facebook.png",
                          height: 30,
                          width: 30,),
                        Text("Sign in with Facebook",
                          style: TextStyle(
                              fontSize: 15  ,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: signInWithGoogle,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/google.jpg",
                          height: 30,
                          width: 30,),
                        Text("Sign in with Google",
                          style: TextStyle(
                              fontSize: 15  ,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    onPressed: signInAnonymously,
                    color: Colors.green[200],
                    child: Center(
                      child: Text("Go Anonymously",
                        style: TextStyle(
                            fontSize: 15  ,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class Mobile extends StatelessWidget {
  final AuthBase auth;
  final Function(User) onSignIn;

  Mobile({@required this.auth, this.onSignIn});

  Future<void> signInAnonymously() async{
    try{
      User user = await auth.signInAnonymously();
      onSignIn(user);
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> signInWithGoogle() async{
    try{
      await auth.signinWithGoogle();

    }catch(e){
      print(e.toString());
    }
  }
  Future<void> signInWithFacebook() async{
    try{
      await auth.signInWithFacebook();

    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          decoration: decoration(),
          child: Column(
            children: <Widget>[
              header(context),
              CustomButton(
                onPressed: signInWithFacebook ,
                color: Colors.indigo[600],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("images/facebook.png",
                      height: 30,
                      width: 30,),
                    Text("Sign in with Facebook",
                      style: TextStyle(
                          fontSize: 15  ,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                onPressed: signInWithGoogle,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("images/google.jpg",
                      height: 30,
                      width: 30,),
                    Text("Sign in with Google",
                      style: TextStyle(
                          fontSize: 15  ,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                onPressed: signInAnonymously,
                color: Colors.green[200],
                child: Center(
                  child: Text("Go Anonymously",
                    style: TextStyle(
                        fontSize: 15  ,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),),
                ),
              ),
            ],
          ),
        ),
      );
  }
}


