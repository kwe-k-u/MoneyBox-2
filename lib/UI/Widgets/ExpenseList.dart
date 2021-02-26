import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/Widgets/TransactionListTile.dart';
import 'package:moneybox_upgrade/utils/TransactionTemp.dart';


String _headerText(DateTime date){
  DateTime _today = DateTime.now();
  if (date.day == _today.day && date.month == _today.month && date.year == _today.year )
    return "Today";
  else if (date.day == _today.day-1 && date.month == _today.month && date.year == _today.year )
    return "Yesterday";
  else return "${date.day}/ ${date.month}/ ${date.year}";
}



class ExpenseList extends StatefulWidget{
  List<TransactionTemp> list;

  ExpenseList({this.list});


  @override
  _ExpenseListState createState() => _ExpenseListState();
}





class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    DateTime _previous = DateTime.now();





    if (widget.list.length == 0)
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
            itemCount: widget.list.length,
            itemBuilder: (context,index){
              //=====================================================
              //transactions to test header
              TransactionTemp transaction = widget.list.elementAt(index);






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
