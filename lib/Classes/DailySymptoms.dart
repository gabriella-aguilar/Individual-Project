import 'package:tracker/Classes/LoggedSymptom.dart';

class DailySymptoms{
  List<LoggedSymptom> _logged = new List<LoggedSymptom>();
  DateTime _dateTime;

  DailySymptoms(){
    _dateTime = DateTime.now();
  }

  DateTime getDate(){return this._dateTime;}

  List<LoggedSymptom> getLogged(){return this._logged;}
  void addLog(LoggedSymptom loggedSymptom){this._logged.add(loggedSymptom);}
}