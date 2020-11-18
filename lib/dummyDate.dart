import 'package:tracker/Classes/symptom.dart';
import 'package:tracker/Classes/user.dart';

var sampleU = [
  new User(1,'Thomas','Jones',new DateTime.now(),'k1816028@gmail.com','savannah23',setSymptoms()),
  new User(2,'John','Jones',new DateTime.now(),'k1816028@kingston.ac.uk','savannah23',setSymptomsJ()),
];


Set setSymptoms(){
  var s = Set<Symptom>();
  s.add(new Symptom('Joint Pain', true, true, true, true));
  s.add(new Symptom('Headache', true, false, true, true));
  return s;
}

Set setSymptomsJ(){
  var s = Set<Symptom>();
  s.add(new Symptom('Joint Pain', true, true, true, true));
  s.add(new Symptom('Headache', true, false, true, true));
  s.add(new Symptom('Menstruation', true, false, false, true));
  return s;
}

Set getDummyData(){
  final starterSymp= Set<Symptom>();
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

