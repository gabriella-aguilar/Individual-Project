import 'package:flutter/material.dart';
import 'package:tracker/Classes/LoggedSymptom.dart';
import 'package:tracker/DataAccess.dart';

void submitPressed(BuildContext context,String name, int intensity, int duration, String location, String intervention, String comments){
  if(MediaQuery.of(context).viewInsets.bottom != 0){
    FocusScope.of(context).unfocus();
  }

 LoggedSymptom ls = LoggedSymptom(
      name: name,
      date: DateTime.now().toString(),
      intensity: intensity,
      duration: duration,
      location: location,
      intervention: intervention,
      comments: comments);
  DataAccess.instance.insertLogged(ls);
  Navigator.pop(context);
}