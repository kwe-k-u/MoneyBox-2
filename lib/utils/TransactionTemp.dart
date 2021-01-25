

import 'package:firebase_database/firebase_database.dart';

class Transaction{
  String _title;
  String _description;
  DateTime _transactionDate = DateTime.now();
  double _amount;
  DatabaseReference databaseReference;


  Transaction({title = "", description = "",  amount = 0}){
    this._title = title;
    this._description = description;
    this._amount = amount.toDouble();

  }



  void setTitle(String title)
  => _title = title;

  void setDescription(String description)
  => _description = description;

  void setTransactionDate(DateTime date)
  => _transactionDate = date;

  void setAmount(double amount)
  => _amount = amount;

  void setDatabaseReference(DatabaseReference reference)
  => this.databaseReference = reference;





  String getTitle()
  => _title;

  String getDescription()
  => _description;

  DateTime getTransactionDate()
  => _transactionDate;

  double getAmount() {
    print("amount $_amount");
    return _amount;
  }



  Map<String, dynamic>getMap(){
    return {
      "title" : _title,
      "description" : _description,
      "transactionDate" : _transactionDate.toString(),
      "amount" : getAmount()
    };
  }
}