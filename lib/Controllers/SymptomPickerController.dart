import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/SymptomClass.dart';
import 'package:tracker/DataAccess.dart';
import 'package:sqflite/sqflite.dart';
import '../Context.dart';


List<Symptom>symptoms;
List<Symptom>tracking;

void setUp(BuildContext context) async{
  symptoms = await DataAccess.instance.getAllSymptoms();
}
