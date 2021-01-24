import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/HomePage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton.icon(
            icon: Icon(Icons.login),
            label: Text("Login with Google"),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=> MyHomePage())
              );
            },
          ),
        ),
      ),
    );
  }
}
