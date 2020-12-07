import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/DataAccess.dart';
import '../Context.dart';
import 'package:sqflite/sqflite.dart';

void submitPressed(BuildContext context,String title,int slider, String comment){
  if(MediaQuery.of(context).viewInsets.bottom != 0){
    FocusScope.of(context).unfocus();
  }
  print("ACTIVITY SUBMIT PRESSED");
  Activity a = new Activity(
      date: DateTime.now().toString(),
      title: title,
      duration: slider,
      comments: comment
  );
  //Provider.of<UserInfo>(context, listen: false).getcurrentUser().getActivities().add(a);
  //DataAccess.instance.insertExercise(a);
  DataAccess.instance.insertExercise(a);
  Navigator.pop(context);
}

