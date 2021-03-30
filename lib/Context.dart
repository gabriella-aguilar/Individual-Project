import 'package:sqflite/sqflite.dart';
import 'package:tracker/Classes/UserClass.dart';
import 'package:flutter/foundation.dart';

class UserInfo extends ChangeNotifier {
  String _currentSymptomName;
  String _currentLoggedDate;
  User _currentUser;
  Database _database;
  bool _loggedIn = false;



  void setDate(String date){this._currentLoggedDate = date;}
  String getLoggedDate(){return this._currentLoggedDate;}


  User getcurrentUser(){return _currentUser;}

  void setcurrentUser(value) {
    _currentUser = value;
  }

  void setSymptomName(String name){_currentSymptomName = name;}
  String getSymptom(){return _currentSymptomName;}

  void setDatabase(Database database){this._database = database;}
  Database getDatabase(){return this._database;}

  bool getloggedIn(){return _loggedIn;}

  void setloggedIn(bool value) {
    _loggedIn = value;
  }
}