import 'package:flutter/material.dart';
import 'package:moneybox_upgrade/UI/Widgets/CustomTextField.dart';
import 'package:moneybox_upgrade/utils/FirebaseHandler.dart';
import 'package:moneybox_upgrade/utils/TransactionTemp.dart';
import 'package:moneybox_upgrade/utils/resources.dart';


class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final formKey = GlobalKey<FormState>();
  TransactionTemp transaction = new TransactionTemp();






  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Add transaction'),
      ),


      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [



                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      hintText: "Transaction title. Eg: Groceries",
                      validator: (value){
                        if(value.isEmpty) {
                          return "Required"; //todo fix overflow when this is displayed
                        }
                        else
                          setState(() {
                            transaction.setTitle(value);
                          });
                        return null;
                      },
                    ),
                  ),




                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      hintText: "+/- 0.00",
                      validator: (value){
                        if (value.isNotEmpty){
                          setState(() {

                            transaction.setAmount(double.parse(value));
                          });
                          return null;
                        }else
                          return "Required";
                      },
                        // labelText: "Amount",


                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      hintText: "One line description of transaction",
                      validator: (value){
                        if (value != null)
                          setState(() {
                            transaction.setDescription(value);

                          });
                        return null;
                      },
                    ),
                  ),




                  // CalendarWidget(
                  //   day: 2,
                  //   month: 2,
                  //   year: 1,
                  // ),



                  //Button to save entry
                  ElevatedButton(
                      child: Text("Save"),
                      onPressed: (){
                        if (formKey.currentState.validate()){
                          saveTransaction(transaction);
                          Navigator.pop(context);
                        }
                      })
                ],
              )
          ),
        ),
      ),
    );
  }
}

