import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/AddTransactionPage.dart';
import 'package:moneybox_upgrade/utils/TransactionTemp.dart';


class TransactionListTile extends StatelessWidget {

  TransactionListTile({
    this.thumbnail,
    this.transaction
});

  final TransactionTemp transaction;
  final IconData thumbnail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return GestureDetector(
      onTap: (){
        showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Edit transaction?"),
                content: Text("This action is not reversible"),
                actions: [


                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),


                  TextButton(
                      onPressed: (){
                        //todo move tile data into edit page
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> AddTransactionPage()));
                      },
                      child: Text("Edit")),


                ],
              );
            }
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        color: Colors.white54,
        child: Container(
          padding: EdgeInsets.all(12.0),
          height: size.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(102.0))
          ),

          child: Row(
            children: [
              Container(
                child: Icon(thumbnail),
                height: double.infinity,
                width: 40.0,
                color: Colors.blue,
              ),


              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction.getTitle(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                      ),
                    ),

                    Spacer(),

                    Text(transaction.getDescription()),
                  ],
                ),
              ),

              Spacer(),


              Text("GHS ${transaction.getAmount()}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0
              ),)
            ],
          )

        ),
      ),
    );
  }
}
