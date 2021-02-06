import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/AddInvoicePage.dart';
import 'package:moneybox_upgrade/UI/BalanceCardWidget.dart';
import 'package:moneybox_upgrade/UI/Settings/SettingsPage.dart';
import 'package:moneybox_upgrade/UI/TransactionListTile.dart';
import 'package:moneybox_upgrade/utils/TransactionTemp.dart';
import 'package:moneybox_upgrade/utils/resources.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeData theme ;

  String _headerText(DateTime date){
    DateTime _today = DateTime.now();
    if (date.day == _today.day && date.month == _today.month && date.year == _today.year )
      return "Today";
    else if (date.day == _today.day-1 && date.month == _today.month && date.year == _today.year )
    return "Yesterday";
    else return "${date.day}/ ${date.month}/ ${date.year}";
  }





  @override
  Widget build(BuildContext context) {
    double total = 0.0;
    return FutureBuilder(
      future: getThemeBool(),
        builder: (context, snap){
      if (snap.connectionState == ConnectionState.done) {
          theme = getTheme(snap.data);

        return MaterialApp(
          theme: theme,
            home: Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AddInvoicePage()
                    ));
                  },
                  child: Icon(Icons.add),
                ),


                body: FutureBuilder(
                  future: getTransactions(),
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
                              trailing: Icon(Icons.account_circle),
                              title: Text("Dashboard"), //todo make bold
                              subtitle: Text("Account name"),
                            ),


                            BalanceCardWidget(
                              colour: Colors.black,
                              balance: total,
                            ),

                            expenseList(snapshot.data)
                          ],
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);
                  },
                )
            )
        );
      }
      return CircularProgressIndicator();
    });
  }



  Widget expenseList(List<Transaction> list){
    DateTime _previous = DateTime.now();





    if (list.length == 0)
      return Container(
        // width: double.infinity,
        // height: double.infinity,
        child: Center(
          child: Text("You have no list of expenses for this account"),
        ),
      );



    //listview of expenses
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      child: Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context,index){
              //=====================================================
              //transactions to test header
              Transaction transaction = list.elementAt(index);






              //=====================================================
              if (! _previous.isAtSameMomentAs(transaction.getTransactionDate()) ) {
                _previous = transaction.getTransactionDate();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(_headerText(
                          transaction.getTransactionDate())),
                    ),
                    TransactionListTile(
                      thumbnail: Icons.money,
                      transaction: transaction,
                    ),
                  ],
                );
              }

              return TransactionListTile(
                thumbnail: Icons.money,
                transaction: transaction,
              );


            },
          )),
    );
  }
}

