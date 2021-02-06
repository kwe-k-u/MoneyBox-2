import 'package:flutter/material.dart';
import 'file:///F:/Projects/Flutter/moneybox_upgrade/lib/UI/Widgets/CalendarWidget.dart';
import 'package:moneybox_upgrade/utils/TransactionTemp.dart';
import 'package:moneybox_upgrade/utils/resources.dart';


class AddInvoicePage extends StatefulWidget {
  @override
  _AddInvoicePageState createState() => _AddInvoicePageState();
}

class _AddInvoicePageState extends State<AddInvoicePage> {
  final formKey = GlobalKey<FormState>();
  Transaction transaction = new Transaction();
ThemeData theme = ThemeData.light();



  @override
  void initState() {
    super.initState();
    getThemeBool().then((value) {
      setState(() {
        theme = getTheme(value);
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return MaterialApp(
      theme: theme,
      home: Scaffold(
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
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    TextFormField(
                      validator: (value){
                        if(value.isEmpty) {
                          return "Required";
                        }
                        else
                          setState(() {
                            transaction.setTitle(value);
                          });
                          return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Transaction title. Eg: Groceries"
                      ),
                    ),




                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if (value.isNotEmpty){
                          setState(() {

                            transaction.setAmount(double.parse(value));
                          });
                          return null;
                        }else
                          return "Required";
                      },
                      decoration: InputDecoration(
                        hintText: "+/- 0.00",
                        labelText: "Amount",


                      ),
                    ),


                    TextFormField(
                      validator: (value){
                        if (value != null)
                          setState(() {
                            transaction.setDescription(value);

                          });
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "One line description of transaction",
                        labelText: "Description of transaction (Optional)",

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
      ),
    );
  }
}

