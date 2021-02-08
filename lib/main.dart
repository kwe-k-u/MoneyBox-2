import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(name: "MoneyBag"),
        builder: (context,snapshot)
            => MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: Scaffold(
                  body: FutureBuilder(
                    future: Firebase.initializeApp(),
                    builder: (context,snapshot){
                      if (snapshot.connectionState == ConnectionState.done)
                        return LoginPage();

                      return CircularProgressIndicator();
                    },
                  ),
                )
            )
    );
  }
}
