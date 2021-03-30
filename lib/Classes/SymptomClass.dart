
class Symptom{
  final String name;
  final int intensity;
  final int location;
  final int duration;
  final int intervention;

  Symptom({this.name,this.intensity,this.duration,this.intervention,this.location});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'intensity': intensity,
      'location': location,
      'duration': duration,
      'intervention': intervention
    };
  }

  String getName(){return this.name;}
  int getLocation(){return this.location;}
  int getIntensity(){return this.intensity;}
  int getDuration(){return this.duration;}
  int getIntervention(){return this.intervention;}
}

