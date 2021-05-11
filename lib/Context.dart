import 'package:flutter/foundation.dart';

class UserInfo extends ChangeNotifier {
  String _currentSymptomName;
  String _currentLoggedDate;


  void setDate(String date){this._currentLoggedDate = date;}
  String getLoggedDate(){return this._currentLoggedDate;}


  void setSymptomName(String name){_currentSymptomName = name;}
  String getSymptom(){return _currentSymptomName;}




}