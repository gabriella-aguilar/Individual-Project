

class LoggedSymptom {

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