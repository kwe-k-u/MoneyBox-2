import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/privacy/Privacy.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title: Text("Settings"),
          leading: BackButton(
              onPressed: (){Navigator.pop(context);}
              ),
        ),



        body: Container(
          child: ListView(
            children: [


              ListTile(
                title: Text("Profile"),
                subtitle: Text("View and edit information provided about this account"),
              ),

              ListTile(
                title: Text("Notifications"),
              ),


              ListTile(
                title: Text("Automated entry"),
                subtitle: Text("Automatically add an entry based on keywords"),
              ),

              SwitchListTile(
                title: Text("Theme"),
                subtitle: Text("Switch to dark theme"),
                value: false,
                onChanged: (value){
                  //switch theme
                },
              ),

              ListTile(
                title: Text("Cards"),
                subtitle: Text("View your card categories"),
              ),

              ListTile(
                title: Text("Privacy"),
                subtitle: Text("View the terms and conditions for this application"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SimplePrivacyPage()));
                },
              ),

              ListTile(
                title: Text("About"),
                subtitle: Text("Application details"),
              )

            ],
          ),
        ),
      ),
    );
  }
}
