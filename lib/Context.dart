import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Classes/UserClass.dart';
import 'package:flutter/foundation.dart';
//import 'package:provider/provider.dart';

class UserInfo extends ChangeNotifier {
  User _currentUser;
  bool _loggedIn = false;
  Set<Symptom> _tracking; //ToDo: Tracking is not logged in

  Set<Symptom> getSymptoms(){return _tracking;}
  void setSymptoms(Set<Symptom> s){this._tracking = s;}

  User getcurrentUser(){return _currentUser;}

  void setcurrentUser(value) {
    _currentUser = value;
  }

  bool getloggedIn(){return _loggedIn;}

  void setloggedIn(bool value) {
    _loggedIn = value;
  }
}