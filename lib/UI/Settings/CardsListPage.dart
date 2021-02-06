import "package:flutter/material.dart";
import 'file:///F:/Projects/Flutter/moneybox_upgrade/lib/UI/Widgets/BalanceCardWidget.dart';
import 'package:moneybox_upgrade/UI/AddBalanceCardPage.dart';


class CardsListPage extends StatefulWidget {
  @override
  _CardsListPageState createState() => _CardsListPageState();
}

class _CardsListPageState extends State<CardsListPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title: Text("Cards"),
          centerTitle: true,
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),


        floatingActionButton: FloatingActionButton(
          elevation: 20.0,
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> AddBalanceCardPage())
            );
          }
        ),



        body: Container(
          child: ListView.builder(
            padding: EdgeInsets.all(12.0),

              itemBuilder: (context,count){
            return Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: BalanceCardWidget(
                colour: Colors.blue,
                balance: 0.2,
              ),
            );
          }),
        ),
      ),
    );
  }
}
//todo add registration process
/**
 * add account name and create first card
 */
