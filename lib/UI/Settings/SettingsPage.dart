import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/Settings/CardsListPage.dart';
import 'package:moneybox_upgrade/UI/privacy/Privacy.dart';
import 'package:moneybox_upgrade/utils/resources.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ThemeData theme = ThemeData.light();
  bool _themeBool = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    getThemeBool().then((value) {

      setState(() {
        _themeBool = value;
        theme = getTheme(value);
      });
    });
    return MaterialApp(
      theme: theme,
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
                value: _themeBool,
                onChanged: (value){
                  setTheme(value);
                  setState(() {
                    theme = getTheme(value);
                    _themeBool = value;
                  });
                },
              ),

              ListTile(
                title: Text("Cards"),
                subtitle: Text("View your card categories"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CardsListPage()));
                },
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
