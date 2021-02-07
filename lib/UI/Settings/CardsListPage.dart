import "package:flutter/material.dart";
import 'file:///F:/Projects/Flutter/moneybox_upgrade/lib/UI/Widgets/BalanceCardWidget.dart';
import 'package:moneybox_upgrade/UI/AddBalanceCardPage.dart';
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
      } else
      return CircularProgressIndicator();
    });
  }
}
//todo add registration process
/**
 * add account name and create first card
 */
