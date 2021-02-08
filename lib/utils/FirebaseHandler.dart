

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moneybox_upgrade/utils/Card.dart';
import 'package:moneybox_upgrade/utils/TransactionTemp.dart';
import 'package:moneybox_upgrade/utils/resources.dart';

///Reference to user doc
///     doc("users/${user.uid}")
DocumentReference collectionReference;
// /users/{userId}/cards/{card}/transactions/{id}


///Returns a list of cards linked to the account
Future<List<CardTemp>>getCardList() async{
  List<CardTemp> list = [];

  CollectionReference collection = collectionReference.collection("cards");

  collection.get().then((value) {


    for (QueryDocumentSnapshot data in value.docs){
      Map<String, String> map = data.data();
      print('card list ${map.toString()} ');
      CardTemp temp = new CardTemp(map["name"], map["icon"], map["theme"]);
      list.add(temp);
    }

  });

  return list;
}


///Returns a list of transactions attached to the currently selected card
getTransactionList() async{
  CollectionReference collection = collectionReference
      .collection("cards/$currentCard}/transactions");
  List<TransactionTemp> transactionList = [];

  collection.get().then((value) {

    for (QueryDocumentSnapshot data in value.docs){
      Map<String, String> map = data.data();
      print('transaction list ${map.toString()} ');
      TransactionTemp temp = new TransactionTemp(
        title: map["title"],
        description: map["description"],
        amount: map["amount"]
      );
      temp.setDatabaseReference(data.reference);
    }

  });

  return transactionList;
}



///Creates a new card (category) for transactions
addCard(CardTemp card){

  CollectionReference id = card.databaseReference;


  if (id == null) {
    id = collectionReference.collection("cards");
    id.add(card.getMap());
  } else {
    // id.update(transaction.getMap());
  }

  card.databaseReference = id;
  setAsCurrentCard(card);
// /users/{userId}/cards/{card}/transactions/{id}
}

///Sets the passed card object as the current card
void setAsCurrentCard(CardTemp card)async{
  currentCard = card;

  await collectionReference.collection("profile").doc("data").set(card.getMap());
}




///Saves the transaction under the current card
void saveTransaction(TransactionTemp transaction){
  DocumentReference id = transaction.databaseReference;


  if (id == null) {
    id = collectionReference.collection("cards/${currentCard.getName()}/transactions").doc();
    id.set(transaction.getMap());
  } else {
    id.update(transaction.getMap());
  }

  transaction.setDatabaseReference(id);
}


///Retrieves the user data such as name and image?
///if none exists, a profile is opened and
Future<bool> getUserData() async{
  bool exists;
  await collectionReference.collection("profile").doc("data").get()
    .then((value) {
      exists = value.exists;
      if (value.exists) {
        Map<String, String> map = Map<String,String>.from(value.data());
        // print('user data ${map.toString()} ');

        currentCard = new CardTemp(map["name"], map["icon"], map["theme"], );
      }
  });
  return exists;
}



