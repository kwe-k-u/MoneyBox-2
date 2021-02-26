import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/AddBalanceCardPage.dart';
import 'package:moneybox_upgrade/UI/HomePage.dart';
import 'package:moneybox_upgrade/UI/Settings/SettingsPage.dart';
import 'package:moneybox_upgrade/UI/privacy/Privacy.dart';
import 'package:moneybox_upgrade/utils/FirebaseHandler.dart';
import 'package:moneybox_upgrade/utils/resources.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  ThemeData theme = ThemeData.light();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googleSignOut();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: OutlineButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text("Login with Google"),
            ],
          ),
          onPressed: (){



                signInWithGoogle().then((value) {
                  getUserData().then((boolean){
                    if (boolean){
                      //If a previous card was selected (a returning user)
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=> MyHomePage())
                      );
                    } else {
                      //If no card has been selected (a new use)
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=> AddBalanceCardPage())
                      );
                    }
                  });
                });
            },
          ),
        ),
    );
  }
}



