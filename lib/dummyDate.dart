import 'package:tracker/symptom.dart';
List getDummyData(){
  List starterSymp= [];
  starterSymp.add(new Symptom('Joint Pain', true, true, true, true));
  starterSymp.add(new Symptom('Headache', true, false, true, true));
  starterSymp.add(new Symptom('Menstruation', true, false, false, true));
  starterSymp.add(new Symptom('Fatigue', true, false, false, true));
  starterSymp.add(new Symptom('Nausea', true, true, false, true));
  starterSymp.add(new Symptom('Dizziness', true, true, false, true));
  starterSymp.add(new Symptom('Swelling', true, true, true, true));
  starterSymp.add(new Symptom('Cramp', true, true, false, true));
  starterSymp.add(new Symptom('Fog', true, true, true, true));
  return starterSymp;
}