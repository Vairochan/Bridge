import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  final String uid;
  final String photoUrl;
  final String displayName;
  final String email;

  User({
    @required this.uid,
    @required this.photoUrl,
    @required this.displayName,
    @required this.email,
  });
}

abstract class AuthBase {
  Future<User> currentUser();
  Future<void> signOut();
  Future<User> signinWithGoogle();
  Future<User> signInAnonymously();
  Future<User> signInWithFacebook();
}

class Auth implements AuthBase{
  final _firebaseAuth = FirebaseAuth.instance;
  User _userFromFirebase(FirebaseUser user) {
  if (user == null) {
  return null;
  }
  return User(
      uid: user.uid,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      email: user.email);
  }

  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> signInWithFacebook() async{
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['public_profile'],
    );
    if(result.accessToken != null ){
      final authResult = await _firebaseAuth.signInWithCredential(
        FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,
        )
      );
      return _userFromFirebase(authResult.user);
    }else{
      throw PlatformException(
          code: "ERROR_ABORTED_BY_USER",
          message: "Sign in aborted by user",
       );
      }
  }

  @override
  Future<User> signinWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if(googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken)
        );
        return _userFromFirebase(authResult.user);
      }else{
        throw PlatformException(
            code: "ERROR_MISSING_AUTH_TOKEN",
            message: "Missing google auth Token "
        );
      }
    } else{
      throw PlatformException(
        code: "ERROR_ABORTED_BY_USER",
        message: "Sign in aborted by user",
      );
    }
  }

  @override
  Future<void> signOut() async{
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }

}
