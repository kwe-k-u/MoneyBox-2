
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTemp{
  String _name;
  String _icon;
  String _theme;
  CollectionReference databaseReference;


  CardTemp(this._name, this._icon, this._theme);

  CardTemp fromMap(Map<String, String> map){
    this._name = map["name"];
    this._icon = map["icon"];
    this._theme = map["theme"];

    return this;
  }

  void setName(String newName){
    this._name = newName;
  }

  void setIcon(String newIcon){
    this._icon = newIcon;
  }

  void setTheme(String newTheme){
    this._theme = newTheme;
  }


  Map<String,String> getMap(){
    return {
      "name" : this._name,
      "icon" : this._icon,
      'theme' : this._theme
    };
  }

  String getName() => this._name;

  IconData getIcon() {
    //todo find a better fix for these getters
    switch(this._icon){
      case "Icons.person":
        return Icons.person;
      case "Icons.account_balance_wallet":
        return Icons.account_balance_wallet;
      case "Icons.home_outlined":
        return Icons.home_outlined;
      case "Icons.airplanemode_active":
        return Icons.airplanemode_active;
      case "Icons.airport_shuttle":
        return Icons.airport_shuttle;
      case "Icons.attach_money":
        return Icons.attach_money;
      case "Icons.wifi":
        return Icons.wifi;
      case "Icons.work":
        return Icons.work;
      default:
        return Icons.error;
    }
  }

  Color getTheme() {
    switch(this._theme){
      case "Colors.black":
        return Colors.black;
      case "Colors.blue":
        return Colors.blue;
      case "Colors.purple":
        return Colors.purple;
      case "Colors.deepOrange":
        return Colors.deepOrange;
      case "Colors.grey":
        return Colors.grey;

      default:
        return Colors.cyan;
    }

  }


}