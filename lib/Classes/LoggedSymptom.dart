import 'SymptomClass.dart';

class LoggedSymptom {
  // Symptom _symptom;
  // DateTime _dateTime;
  // String _comment;
  //
  // LoggedSymptom(Symptom symptom, DateTime dateTime,String comment){
  //   this._dateTime = dateTime;
  //   this._symptom = symptom;
  //   this._comment = comment;
  // }
  //
  // Symptom getSymptom(){return this._symptom;}
  // DateTime getDate(){return this._dateTime;}
  // String getComment(){return this._comment;}
  // void setComment(String c){this._comment = c;}

  final String date;
  final String name;
  final String comments;
  final int intensity;
  final String location;
  final int duration;
  final String intervention;

  LoggedSymptom({this.date,this.name,this.comments,this.intensity,this.location,this.duration,this.intervention});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'name': name,
      'comments': comments,
      'intensity': intensity,
      'location': location,
      'duration': duration,
      'intervention': intervention

    };
  }
  @override
  String toString(){
    String text = this.name + "\n" + this.date;
    return text;
  }

  String getSymptom(){return this.name;}
  String getDate(){return this.date;}
  String getComment(){return this.comments;}
  int getIntensity(){return this.intensity;}
  String getLocation(){return this.location;}
  int getDuration(){return this.duration;}
  String getIntervention(){return this.intervention;}
}