import 'package:sqflite/sqflite.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Classes/UserClass.dart';
import 'package:flutter/foundation.dart';
//import 'package:provider/provider.dart';

class UserInfo extends ChangeNotifier {
  User _currentUser;
  Database _database;
  bool _loggedIn = false;
  List<Symptom> _tracking; //ToDo: Tracking is not logged in

  List<Symptom> getSymptoms(){return _tracking;}
  void setSymptoms(List<Symptom> s){this._tracking = s;}

  User getcurrentUser(){return _currentUser;}

  void setcurrentUser(value) {
    _currentUser = value;
  }

  void setDatabase(Database database){this._database = database;}
  Database getDatabase(){return this._database;}

  bool getloggedIn(){return _loggedIn;}

  void setloggedIn(bool value) {
    _loggedIn = value;
  }
}