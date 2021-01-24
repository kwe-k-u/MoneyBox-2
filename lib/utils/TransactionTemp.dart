

class Transaction{
  String _title;
  String _description;
  DateTime _transactionDate = DateTime.now();
  double _amount;
  //todo add database reference




  void setTitle(String title)
  => _title = title;

  void setDescription(String description)
  => _description = description;

  void setTransactionDate(DateTime date)
  => _transactionDate = date;

  void setAmount(double amount)
  => _amount = amount;



  createFromMap(Map<String, dynamic> map){
    setTitle(map["title"]);
    setDescription(map["description"]);
    setTransactionDate(map["transactionDate"]);
    setAmount(map["amount"]);

    return this;
  }


  String getTitle()
  => _title;

  String getDescription()
  => _description;

  DateTime getTransactionDate()
  => _transactionDate;

  double getAmount()
  => _amount;



  Map<String, dynamic>getMap(){
    return {
      "title" : getTitle(),
      "description" : getDescription(),
      "transactionDate" : getTransactionDate().toString,
      "amount" : getAmount()
    };
  }
}