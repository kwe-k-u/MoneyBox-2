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

    getThemeBool().then((value) {
      setState(() {
        theme = getTheme(value);
      });
    });

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        body: Center(
          child: ElevatedButton.icon(
            icon: Icon(Icons.login),
            label: Text("Login with Google"),
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
      ),
    );
  }
}
