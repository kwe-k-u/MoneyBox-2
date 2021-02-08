import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moneybox_upgrade/utils/Card.dart';
import 'package:moneybox_upgrade/utils/FirebaseHandler.dart';
import 'package:shared_preferences/shared_preferences.dart';



//variable declarations

final GoogleSignIn googleSignIn = GoogleSignIn();

final FirebaseAuth _auth = FirebaseAuth.instance;
CardTemp currentCard;
User user;















///Allows a user with a Google account to sign in
Future<User> signInWithGoogle() async{

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

  final UserCredential authResult = await _auth.signInWithCredential(authCredential);
  user = authResult.user;


  assert(!user.isAnonymous);
  assert (await user.getIdToken() != null);

  final User currentUser = _auth.currentUser;
  assert(currentUser.uid == user.uid);

  collectionReference = FirebaseFirestore.instance.doc("users/${user.uid}");

  return user;
}

///Signs out the user
void googleSignOut() async {
  await googleSignIn.signOut();
}






  ///Gets a boolean to show the user's preference for dark theme. If none is used then,
/// the default is false
  Future<bool> getThemeBool() async{
    final preference = await SharedPreferences.getInstance();
    return  preference.getBool("darkTheme") ?? false;
  }


  void setTheme(bool value) async{
    final preference = await SharedPreferences.getInstance();
    await preference.setBool("darkTheme", value);
  }


  ///Returns a theme based on the boolean entered. True for dark theme and false for light
  ThemeData getTheme(bool value){

    if (value) //if user prefers dark theme
      return ThemeData.dark();

      return ThemeData.light();
  }



