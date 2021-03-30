import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/Classes/MealClass.dart';
import 'package:tracker/Classes/SymptomClass.dart';


class User{

  String firstName;
  String lastName;
  DateTime dob;
  String email;
  String password;
  var symptoms = new List<Symptom>(); //tracking
  var logged = new List<LoggedSymptom>(); //symptoms experienced
  var  meals = new List<Meal>();
  var activities = new List<Activity>();
  Map<DateTime, List<LoggedSymptom>> _dailies = new Map();

  User(String fn, String ln, DateTime d, String e, String p, List<Symptom> s){
    this.firstName = fn;
    this.lastName = ln;
    this.dob = d;
    this.email = e;
    this.password = p;
    this.symptoms = s;
  }

  List<Symptom> getSymptoms(){return this.symptoms;}
  void setSymptoms(List<Symptom> sy){
    this.symptoms = sy;
  }


  Map<DateTime,List<LoggedSymptom>> getDailies(){return this._dailies;}

  List<Meal> getMeals(){return this.meals;}

  List<Activity> getActivities(){return this.activities;}

  List<LoggedSymptom> getLoggedSymptoms(){return this.logged;}
  void deleteLoggedSymptom(LoggedSymptom ls){logged.remove(ls);}

  String getFirstName(){return this.firstName;}
  void setFirstName(String fn){this.firstName = fn;}

  String getLastName(){return this.lastName;}
  void setLastName(String ln){this.lastName = ln;}

  DateTime getDob() {return this.dob;}
  void setDob(DateTime d) {this.dob = d;}

  String getEmail(){return this.email;}
  void setEmail(String e){this.email = e;}

  String getPassword(){return this.password;}
  void setPassword(String p){this.password = p;}
}