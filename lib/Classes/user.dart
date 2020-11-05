import 'package:tracker/Classes/symptom.dart';
User sampleU = new User('Thomas','Jones',new DateTime.now(),'k1816028@gmail.com','savannah23');


class User{
  String _firstName;
  String _lastName;
  DateTime _dob;
  String _email;
  String _password;
  var _symptoms = Set<Symptom>();
  User(String fn, String ln, DateTime d, String e, String p){
    this._firstName = fn;
    this._lastName = ln;
    this._dob = d;
    this._email = e;
    this._password = p;
  }

  Set<Symptom> getSymptoms(){return this._symptoms;}
  void setSymptoms(Set<Symptom> s){this._symptoms = s;}

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