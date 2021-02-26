import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/HomePage.dart';
import 'package:moneybox_upgrade/UI/privacy/Privacy.dart';
import 'package:moneybox_upgrade/utils/resources.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {





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
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=> MyHomePage())
              );
            });
          },
        ),
      ),
    );
  }
}
