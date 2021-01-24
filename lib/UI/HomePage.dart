import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/AddInvoicePage.dart';
import 'package:moneybox_upgrade/UI/BalanceCardWidget.dart';
import 'package:moneybox_upgrade/UI/TransactionListTile.dart';
import 'package:moneybox_upgrade/utils/TransactionTemp.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _previous = DateTime.now();

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
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> AddInvoicePage()
            ));
          },
          child: Icon(Icons.add),
        ),



        body: Padding(
          padding: const EdgeInsets.only(top: 24.0,bottom: 12.0, left: 8.0, right: 8.0),
          child: Column(
            children: [

              ListTile(
                leading: Icon(Icons.zoom_out_map),
                trailing: Icon(Icons.account_circle),
                title: Text("Dashboard"),//todo make bold
                subtitle: Text("Account name"),
              ),


              BalanceCardWidget(
                colour: Colors.black,
                balance: 120,
              ),

              //listview of expenses
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                child: Expanded(
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context,index){
                        //=====================================================
                        //transactions to test header
                        Transaction transaction;
                        Transaction today = Transaction().createFromMap({

                          "title" : "Breakfast",
                          "description" : "Something to eat",
                          "transactionDate" : DateTime.now(),
                          "amount" : 12.0
                        });
                        Transaction yesterday = Transaction().createFromMap({

                          "title" : "Breakfast",
                          "description" : "Something to eat",
                          "transactionDate" : DateTime.now().subtract(Duration(days: 1)),
                          "amount" : 12.0
                        });
                        Transaction prev = Transaction().createFromMap({

                          "title" : "Breakfast",
                          "description" : "Something to eat",
                          "transactionDate" : DateTime.now().subtract(Duration(days: 2)),
                          "amount" : 12.0
                        });


                        if (index<5)
                            transaction = today;

                        else if (index <15)
                          transaction = yesterday;
                        else
                          transaction = prev;


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
              )
            ],
          ),
        )
      )
    );
  }
}

