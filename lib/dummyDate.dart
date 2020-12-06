//
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:tracker/Classes/LoggedSymptom.dart';
// import 'package:tracker/Classes/SymptomClass.dart';
// import 'package:tracker/Classes/UserClass.dart';
//
// import 'Context.dart';
// DateTime bday = DateTime(1998,11,23,0,0,0,0,0);
// var sampleU = [
//   new User('Thomas','Jones',bday,'k1816028@gmail.com','savannah23',setSymptoms()),
//   new User('John','Jones',bday,'k1816028@kingston.ac.uk','savannah23',setSymptomsJ()),
// ];
//
// void setUp(BuildContext context){
//   DateTime one = DateTime(2020,11,23,14,15,0,0,0);
//   DateTime two = DateTime(2020,11,20,14,30,0,0,0);
//   DateTime three = DateTime(2020,11,23,14,45,0,0,0);
//   List<Symptom> sym = getDummyData();
//   LoggedSymptom ls = new LoggedSymptom(sym[0], one, "ow");
//   Provider.of<UserInfo>(context, listen: false).getcurrentUser().logSymptom(ls);
//   ls = new LoggedSymptom(sym[2], two, "ouchie");
//   Provider.of<UserInfo>(context, listen: false).getcurrentUser().logSymptom(ls);
//   ls = new LoggedSymptom(sym[1], three, "yikes");
//   Provider.of<UserInfo>(context, listen: false).getcurrentUser().logSymptom(ls);
// }
//
// List setSymptoms(){
//   var s = List<Symptom>();
//   s.add(new Symptom('Joint Pain', true, true, true, true));
//   s.add(new Symptom('Headache', true, false, true, true));
//   return s;
// }
//
// List setSymptomsJ(){
//   var s = List<Symptom>();
//   s.add(new Symptom('Joint Pain', true, true, true, true));
//   s.add(new Symptom('Headache', true, false, true, true));
//   s.add(new Symptom('Menstruation', true, false, false, true));
//   return s;
// }
//
// List getDummyData(){
//   final starterSymp= List<Symptom>();
//   starterSymp.add(new Symptom('Joint Pain', true, true, true, true));
//   starterSymp.add(new Symptom('Headache', true, false, true, true));
//   starterSymp.add(new Symptom('Menstruation', true, false, false, true));
//   starterSymp.add(new Symptom('Fatigue', true, false, false, true));
//   starterSymp.add(new Symptom('Nausea', true, true, false, true));
//   starterSymp.add(new Symptom('Dizziness', true, true, false, true));
//   starterSymp.add(new Symptom('Swelling', true, true, true, true));
//   starterSymp.add(new Symptom('Cramp', true, true, false, true));
//   starterSymp.add(new Symptom('Fog', true, true, true, true));
//   starterSymp.add(new Symptom('Bloating',false,false,false,false));
//   starterSymp.add(new Symptom('Stomach Cramping',true,false,true,true));
//
//   return starterSymp;
// }
//
