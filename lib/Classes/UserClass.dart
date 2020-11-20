import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Classes/SymptomClass.dart';


class User{
  int _id;
  String _firstName;
  String _lastName;
  DateTime _dob;
  String _email;
  String _password;
  var _symptoms = new Set<Symptom>(); //tracking
  var _logged = new Set<LoggedSymptom>(); //symptoms experienced
  var _meals = new Set<Meal>();
  var _activities = new Set<Activity>();

  User(int i,String fn, String ln, DateTime d, String e, String p, Set<Symptom> s){
    this._firstName = fn;
    this._lastName = ln;
    this._dob = d;
    this._email = e;
    this._password = p;
    this._symptoms = s;
    this._id = i;
  }

  Set<Symptom> getSymptoms(){return this._symptoms;}
  void setSymptoms(Set<Symptom> sy, Set<Symptom> r){
    this._symptoms.removeAll(r);
    this._symptoms.addAll(sy);
  }


  Set<Meal> getMeals(){return this._meals;}

  Set<Activity> getActivities(){return this._activities;}

  Set<LoggedSymptom> getLoggedSymptoms(){return this._logged;}
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