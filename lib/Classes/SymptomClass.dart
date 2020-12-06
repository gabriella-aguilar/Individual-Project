
class Symptom{
  // String _name;
  // bool _intensity;
  // bool _location;
  // bool _duration;
  // bool _intervention;
  //
  // Symptom(String n, bool i, bool l, bool d, bool int){
  //   this._intervention=int;
  //   this._intensity=i;
  //   this._duration=d;
  //   this._location=l;
  //   this._name=n;
  // }
  //
  // String getName(){return this._name;}
  // bool getLocation(){return this._location;}
  // bool getIntensity(){return this._intensity;}
  // bool getDuration(){return this._duration;}
  // bool getIntervention(){return this._intervention;}
  //
  // void setName(String n){this._name=n;}
  // void setLocation(bool value){this._location=value;}
  // void setDuration(bool value){this._duration=value;}
  // void setIntensity(bool value){this._intensity=value;}
  // void setIntervention(bool value){this._intervention=value;}

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

