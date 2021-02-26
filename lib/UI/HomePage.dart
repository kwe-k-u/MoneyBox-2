import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/AddInvoicePage.dart';
import 'package:moneybox_upgrade/UI/Settings/SettingsPage.dart';
import 'package:moneybox_upgrade/UI/Widgets/BalanceCardWidget.dart';
import 'package:moneybox_upgrade/UI/Widgets/ExpenseList.dart';
import 'package:moneybox_upgrade/utils/FirebaseHandler.dart';
import 'package:moneybox_upgrade/utils/resources.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {





  @override
  Widget build(BuildContext context) {
    double total = 0.0;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddInvoicePage()
            ));
          },
          child: Icon(Icons.add),
        ),


                body: FutureBuilder(
                  future: getTransactionList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      for (var e in snapshot.data)
                        total += e.getAmount();
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, bottom: 12.0, left: 8.0, right: 8.0),
                        child: Column(
                          children: [

                            ListTile(
                              leading: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SettingsPage())
                                  );
                                },
                              ),

                              trailing: Image.network(user.photoURL,
                                height: 40.0,
                                width: 40.0,),

                              title: Text("Dashboard"), //todo make bold

                              subtitle: Text(user.displayName),
                            ),


                            BalanceCardWidget(
                              name: currentCard.getName(),
                              colour: currentCard.getTheme(),
                              balance: total,
                              icon: currentCard.getIcon(),
                            ),
                            ExpenseList(list: snapshot.data)
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },
        )
    );
  }



}





