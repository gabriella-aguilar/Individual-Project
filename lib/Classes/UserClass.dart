import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Classes/SymptomClass.dart';


class User{

  String _firstName;
  String _lastName;
  DateTime _dob;
  String _email;
  String _password;
  var _symptoms = new List<Symptom>(); //tracking
  var _logged = new List<LoggedSymptom>(); //symptoms experienced
  var _meals = new List<Meal>();
  var _activities = new List<Activity>();

  User(String fn, String ln, DateTime d, String e, String p, List<Symptom> s){
    this._firstName = fn;
    this._lastName = ln;
    this._dob = d;
    this._email = e;
    this._password = p;
    this._symptoms = s;
  }

  List<Symptom> getSymptoms(){return this._symptoms;}
  void setSymptoms(List<Symptom> sy){
    this._symptoms = sy;
  }


  List<Meal> getMeals(){return this._meals;}

  List<Activity> getActivities(){return this._activities;}

  List<LoggedSymptom> getLoggedSymptoms(){return this._logged;}
  void deleteLoggedSymptom(LoggedSymptom ls){_logged.remove(ls);}

  String getFirstName(){return this._firstName;}
  void setFirstName(String fn){this._firstName = fn;}

  String getLastName(){return this._lastName;}
  void setLastName(String ln){this._lastName = ln;}

  DateTime getDob() {return this._dob;}
  void setDob(DateTime d) {this._dob = d;}

  String getEmail(){return this._email;}
  void setEmail(String e){this._email = e;}

  String getPassword(){return this._password;}
  void setPassword(String p){this._password = p;}
}