import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/Classes/ActivityClass.dart';
import 'package:tracker/DataAccess.dart';
import '../Context.dart';

void submitPressed(BuildContext context,String title,int slider, String comment){
  Activity a = new Activity(
      date: DateTime.now().toString(),
      title: title,
      duration: slider,
      comments: comment
  );
  //Provider.of<UserInfo>(context, listen: false).getcurrentUser().getActivities().add(a);
  DataAccess.instance.insertExercise(a);
  Navigator.pop(context);
}