import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/LoginPage.dart';
import 'package:moneybox_upgrade/utils/resources.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getThemeBool(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            theme = getTheme(snapshot.data);
            return MaterialApp(
              darkTheme: ThemeData.dark(),
                themeMode: ThemeMode.system,
                title: 'Flutter Demo',
                theme: theme,
                // theme: ThemeData(
                //   primarySwatch: Colors.blue,
                //   visualDensity: VisualDensity.adaptivePlatformDensity,
                // ),
                home: Scaffold(
                  body: FutureBuilder(
                    future: Firebase.initializeApp(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return LoginPage();

                      return CircularProgressIndicator();
                    },
                  ),
                )
            );
        }
        return Center(
          child: CircularProgressIndicator()
        );
    });
  }
}
