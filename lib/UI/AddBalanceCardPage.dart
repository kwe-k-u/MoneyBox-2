import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/utils/Card.dart';
import 'package:moneybox_upgrade/utils/FirebaseHandler.dart';
import 'package:moneybox_upgrade/utils/resources.dart';

class AddBalanceCardPage extends StatefulWidget {
  @override
  _AddBalanceCardPageState createState() => _AddBalanceCardPageState();
}

class _AddBalanceCardPageState extends State<AddBalanceCardPage> {
  Size size;
  String _name = "";
  String _icon = "Icons.person";
  String _theme = "Colors.black";
  ThemeData pageTheme;


  @override
  void initState() {
    super.initState();
    getThemeBool().then((value) {
      setState(() {
        pageTheme = getTheme(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        title: Text("Add Card"),
        centerTitle: true,
        leading: BackButton(
          onPressed: ()=> Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [

            TextField(
              maxLength: 50,
              decoration: InputDecoration(
                icon: Text("Card name"),
              ),
              onChanged: (value){
                setState(() {
                  _name = value;
                });
              },
            ),


            //Theme
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                onChanged:(value){

                  setState(() {
                    _theme = value;
                  });
                },
                decoration: InputDecoration(
                    icon: Text("Theme")
                ),
                value: _theme,

                items: [
                  /**
                   * black
                   * blue
                   * purple
                   * deepOrange
                   * grey
                   *
                   */

                  //black
                  DropdownMenuItem(
                      value: "Colors.black",
                      child: Text("Black")
                  ),

                  //blue
                  DropdownMenuItem(
                      value: "Colors.blue",
                      child: Text("Blue")
                  ),

                  //purple
                  DropdownMenuItem(
                      value: "Colors.purple",
                      child: Text("Purple")
                  ),

                  //Orange
                  DropdownMenuItem(
                      value: "Colors.deepOrange",
                      child: Text("Orange")
                  ),

                  //grey
                  DropdownMenuItem(
                      value: "Colors.grey",
                      child: Text("Grey")
                  ),

                ],
              ),
            ),

            //Icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                onChanged:(value){

                  setState(() {
                    _icon = value;
                  });
                },
                decoration: InputDecoration(
                    icon: Text("Icon")
                ),
                value: _icon,

                //todo style to be a grid maybe? or a popup of a grid
                items: [
                  /**
                   * person
                   * home_outline
                   * account_balance_wallet
                   * airplanemode_active
                   * airport_shuttle
                   * attach_money
                   * wifi
                   * work
                   *
                   */

                  //person
                  DropdownMenuItem(
                      value: "Icons.person",
                      child: Icon(Icons.person)
                  ),

                  //account_balance wallet
                  DropdownMenuItem(
                      value: "Icons.account_balance_wallet",
                      child: Icon(Icons.account_balance_wallet)
                  ),

                  //home_outline
                  DropdownMenuItem(
                      value: "Icons.home_outlined",
                      child: Icon(Icons.home_outlined)
                  ),

                  //airplanemode_active
                  DropdownMenuItem(
                      value: "Icons.airplanemode_active",
                      child: Icon(Icons.airplanemode_active)
                  ),

                  //airport shuttle
                  DropdownMenuItem(
                      value: "Icons.airport_shuttle",
                      child: Icon(Icons.airport_shuttle)
                  ),

                  //attach money
                  DropdownMenuItem(
                      value: "Icons.attach_money",
                      child: Icon(Icons.attach_money)
                  ),

                  //wifi
                  DropdownMenuItem(

                      value: "Icons.wifi",
                      child: Icon(Icons.wifi)
                  ),

                  //work
                  DropdownMenuItem(
                      value: "Icons.work",
                      child: Icon(Icons.work)
                  ),
                ],
              ),
            ),
            Spacer(),


            ElevatedButton(
                child: Text("Add Card"),
                onPressed: (){
                  //todo upload card
                  if (_name.isNotEmpty) {
                    Navigator.pop(context);
                  }
                }
            )
          ],
        ),
    )
    );
  }
}
