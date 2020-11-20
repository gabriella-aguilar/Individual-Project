import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Classes/UserClass.dart';

var sampleU = [
  new User('Thomas','Jones',new DateTime.now(),'k1816028@gmail.com','savannah23',setSymptoms()),
  new User('John','Jones',new DateTime.now(),'k1816028@kingston.ac.uk','savannah23',setSymptomsJ()),
];


List setSymptoms(){
  var s = List<Symptom>();
  s.add(new Symptom('Joint Pain', true, true, true, true));
  s.add(new Symptom('Headache', true, false, true, true));
  return s;
}

List setSymptomsJ(){
  var s = List<Symptom>();
  s.add(new Symptom('Joint Pain', true, true, true, true));
  s.add(new Symptom('Headache', true, false, true, true));
  s.add(new Symptom('Menstruation', true, false, false, true));
  return s;
}

List getDummyData(){
  final starterSymp= List<Symptom>();
  starterSymp.add(new Symptom('Joint Pain', true, true, true, true));
  starterSymp.add(new Symptom('Headache', true, false, true, true));
  starterSymp.add(new Symptom('Menstruation', true, false, false, true));
  starterSymp.add(new Symptom('Fatigue', true, false, false, true));
  starterSymp.add(new Symptom('Nausea', true, true, false, true));
  starterSymp.add(new Symptom('Dizziness', true, true, false, true));
  starterSymp.add(new Symptom('Swelling', true, true, true, true));
  starterSymp.add(new Symptom('Cramp', true, true, false, true));
  starterSymp.add(new Symptom('Fog', true, true, true, true));
  starterSymp.add(new Symptom('Bloating',false,false,false,false));
  starterSymp.add(new Symptom('Stomach Cramping',true,false,true,true));

  return starterSymp;
}

