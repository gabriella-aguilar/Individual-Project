
class Symptom{
  String _name;
  bool _intensity;
  bool _location;
  bool _duration;
  //String _comment;
  bool _intervention;

  Symptom(String n, bool i, bool l, bool d, bool int){
    this._intervention=int;
    this._intensity=i;
    this._duration=d;
    this._location=l;
    this._name=n;
  }

  String getName(){return this._name;}
  bool getLocation(){return this._location;}
  bool getIntensity(){return this._intensity;}
  bool getDuration(){return this._duration;}
  bool getIntervention(){return this._intervention;}

  void setName(String n){this._name=n;}
  void setLocation(bool value){this._location=value;}
  void setDuration(bool value){this._duration=value;}
  void setIntensity(bool value){this._intensity=value;}
  void setIntervention(bool value){this._intervention=value;}
}

