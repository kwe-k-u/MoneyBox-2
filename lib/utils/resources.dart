

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moneybox_upgrade/utils/TransactionTemp.dart';
import 'package:shared_preferences/shared_preferences.dart';



//variable declarations

final GoogleSignIn googleSignIn = GoogleSignIn();

final FirebaseAuth _auth = FirebaseAuth.instance;
 User user;
final databaseReference = FirebaseDatabase.instance.reference();
ThemeData theme;









void saveTransaction(Transaction transaction){
  DatabaseReference id = transaction.databaseReference;
  print("asdf user ${transaction.getMap()}");


  if (id == null) {
    id = databaseReference.child('${user.uid}/transactions/').push();
    id.set(transaction.getMap());
  } else {
    id.update(transaction.getMap());
  }

  transaction.setDatabaseReference(id);
}






///Allows a user with a Google account to sign in
Future<User> signInWithGoogle() async{


  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

  final UserCredential authResult = await _auth.signInWithCredential(authCredential);
  user = authResult.user;


  assert(!user.isAnonymous);
  assert (await user.getIdToken() != null);

  final User currentUser = _auth.currentUser;
  assert(currentUser.uid == user.uid);



  return user;
}

///Signs out the user
void googleSignOut() async {
  await googleSignIn.signOut();
}




  Future<List<Transaction>> getTransactions() async {
    DataSnapshot dataSnapshot = await databaseReference.child('${user.uid}/transactions').once();
    List<Transaction> transactionList = [];
    if (dataSnapshot.value != null){
      dataSnapshot.value.forEach((key,value) {
        Transaction transaction = new Transaction(
          title: value["title"],
          description: value["description"],
          amount: value["amount"]
        );

        transaction.setTransactionDate(DateTime.parse(value["transactionDate"]));
        transaction.setDatabaseReference(databaseReference.child('${user.uid}/transactions/' + key));
        transactionList.add(transaction);
      }
      );
    }
    return transactionList;
  }


  ///Gets a boolean to show the user's preference for dark theme. If none is used then,
/// the default is false
  Future<bool> getThemeBool() async{
    final preference = await SharedPreferences.getInstance();
    return  preference.getBool("darkTheme") ?? false;
  }


  void setTheme(bool value) async{
    final preference = await SharedPreferences.getInstance();
    await preference.setBool("darkTheme", value);
  }


  ///Returns a theme based on the boolean entered. True for dark theme and false for light
  ThemeData getTheme(bool value){

    if (value) //if user prefers dark theme
      return ThemeData.dark();

      return ThemeData.light();
  }

