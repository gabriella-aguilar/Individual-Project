import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/Classes/TrackingClass.dart';
import 'package:tracker/DataAccess.dart';
import 'package:sqflite/sqflite.dart';
import '../Context.dart';


List<Symptom>symptoms;
List<Tracking>tracking;
List<String> names;

void setUp(BuildContext context) async{
  symptoms = await DataAccess.instance.getAllSymptoms();
  //final List<Tracking> t= await DataAccess.instance.getAllTracking();
  names = new List<String>();
  tracking = await DataAccess.instance.getAllTracking();
  for(Tracking t in tracking){
    names.add(t.getName());
  }
}


void save(BuildContext context){
  for(String n in names){
    Tracking nt = new Tracking(name: n);
    if(!tracking.contains(nt)){
      DataAccess.instance.insertTracking(nt);
    }
  }

  for(Tracking t in tracking){
    if(!names.contains(t.getName())){
      DataAccess.instance.deleteTracking(t.getName());
    }
  }
  Navigator.pop(context,tracking);
}