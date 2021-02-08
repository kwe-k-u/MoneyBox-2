import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'file:///F:/Projects/Flutter/moneybox_upgrade/lib/UI/Widgets/BalanceCardWidget.dart';
import 'package:moneybox_upgrade/UI/AddBalanceCardPage.dart';
import 'package:moneybox_upgrade/utils/Card.dart';
import 'package:moneybox_upgrade/utils/FirebaseHandler.dart';
import 'package:moneybox_upgrade/utils/resources.dart';


class CardsListPage extends StatefulWidget {
  @override
  _CardsListPageState createState() => _CardsListPageState();
}



class _CardsListPageState extends State<CardsListPage> {
  ThemeData theme;




  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getThemeBool(),
        builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.done){
        theme = getTheme(snapshot.data);
        return MaterialApp(
          theme: theme,
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
              child: FutureBuilder(
                future: getCardList(),
                builder: (context,snapshot){

                  print(snapshot);
                  return ListView.builder(
                    itemCount:snapshot.data.length ,
                      itemBuilder: (context,index){
                      CardTemp card = snapshot.data[index];

                    return Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: BalanceCardWidget(
                        name: card.getName(),
                        icon: card.getIcon(),
                        colour: card.getTheme(),
                        balance: 0,
                      ),
                    );
                  });
                },
              )
            ),
          ),
        );
      } else
      return CircularProgressIndicator();
    });
  }
}
