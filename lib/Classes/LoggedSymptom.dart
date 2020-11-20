import 'SymptomClass.dart';

class LoggedSymptom {
  Symptom _symptom;
  DateTime _dateTime;
  String _comment;

  LoggedSymptom(Symptom symptom, DateTime dateTime,String comment){
    this._dateTime = dateTime;
    this._symptom = symptom;
    this._comment = comment;
  }

  Symptom getSymptom(){return this._symptom;}
  DateTime getDate(){return this._dateTime;}
  String getComment(){return this._comment;}
  void setComment(String c){this._comment = c;}
}