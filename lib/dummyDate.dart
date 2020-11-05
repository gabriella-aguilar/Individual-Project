import 'file:///C:/Users/gabri/OneDrive/Desktop/tracker/lib/Classes/symptom.dart';
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

